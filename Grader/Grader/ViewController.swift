//
//  ViewController.swift
//  Grader
//
//  Created by GLO_macbookpro on 11/10/2562 BE.
//  Copyright © 2562 GLO_macbookpro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtScore: UITextField!
    @IBOutlet weak var btnGrade: UIButton!
    @IBOutlet weak var lblGrade: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.btnGrade.addTarget(self, action: #selector(self.calculateGrade), for: .touchUpInside)
    }
    
    @objc func calculateGrade() {
        if let scoreString = self.txtScore.text {
            if let score = Int(scoreString) {
                if score >= 80 {
                    self.lblGrade.text = "Your grade is A"
                }
                else if score < 80 && score >= 70 {
                    self.lblGrade.text = "Your grade is B"
                }
                else if score < 70 && score >= 60 {
                    self.lblGrade.text = "Your grade is C"
                }
                else if score < 60 && score >= 50 {
                    self.lblGrade.text = "Your grade is D"
                }
                else if score < 50 {
                    self.lblGrade.text = "Your grade is F"
                }
            }
        }
    }


}

