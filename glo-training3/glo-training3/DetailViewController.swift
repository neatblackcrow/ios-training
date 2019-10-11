//
//  DetailViewController.swift
//  glo-training3
//
//  Created by GLO_macbookpro on 9/10/2562 BE.
//  Copyright © 2562 GLO_macbookpro. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSurname: UILabel!
    
    var imageString: String = ""
    var nameString: String = ""
    var surnameString: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblName.text = "Firstname: \(nameString)"
        lblSurname.text = "Lastname: \(surnameString)"
        
        
        imgAvatar.af_setImage(withURL: <#T##URL#>)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
