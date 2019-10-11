//
//  ViewController.swift
//  glo-training3
//
//  Created by GLO_macbookpro on 9/10/2562 BE.
//  Copyright © 2562 GLO_macbookpro. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let urlPath: String = "http://reqres.in/api/users?page=1"
    var jsonData: JSON = JSON.null
    
    var imageString: String = ""
    var nameString: String = ""
    var surnameString: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.loadService()
    }
    
    func loadService() {
        Alamofire.request(urlPath, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if response.response?.statusCode == 200 {
                let result = response.result.value
                self.jsonData = JSON(result)
                self.tableView.reloadData()
                
                print("Result: \(self.jsonData)")
            } else {
                print("Connection failed")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.jsonData["data"].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserListTableViewCell
        
        let data = self.jsonData["data"][indexPath.row]
        cell.lblName.text = data["first_name"].stringValue
        cell.lblSurname.text = data["last_name"].stringValue
        
        let imageURLString = data["avatar"].stringValue
        cell.imgAvatar.layer.cornerRadius = cell.imgAvatar.frame.width / 2
        
        if let url = URL.init(string: imageURLString) {
            cell.imgAvatar.af_setImage(withURL: url)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = self.jsonData["data"][indexPath.row]
        
        nameString = data["first_name"].stringValue
        surnameString = data["last_name"].stringValue
        imageString = data["avatar"].stringValue
        
        self.performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "toDetail" {
            let destination = segue.destination as! DetailViewController
            destination.imageString = imageString
            destination.nameString = nameString
            destination.surnameString = surnameString
        }
    }

}

