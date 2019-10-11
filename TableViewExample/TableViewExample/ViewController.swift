//
//  ViewController.swift
//  TableViewExample
//
//  Created by GLO_macbookpro on 8/10/2562 BE.
//  Copyright © 2562 GLO_macbookpro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var btnAdd: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.btnAdd.addTarget(self, action: #selector(addButtonDidTap), for: .touchUpInside)
    }
    
    @objc func addButtonDidTap() {
        self.getTextFromTextField()
    }

    func getTextFromTextField() {
        let text = textField.text!
        print(text)
        
        if let textUnwrap = textField.text {
            print(textUnwrap)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: IndexPath.init(row: 0, section: section)) as! HeaderTableViewCell
        
        headerView.label.text = "Section: " + String(section)
        return headerView
    }

}

