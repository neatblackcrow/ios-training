//
//  ViewController.swift
//  glo-training4
//
//  Created by GLO_macbookpro on 10/10/2562 BE.
//  Copyright © 2562 GLO_macbookpro. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var txtLotnum: UITextField!
    @IBOutlet weak var btnCheck: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    let apiPath: String = "https://hq-api-dev-01.glo.or.th/lotterycheck/sheets/get"
    var lotteryResultDataJson: JSON = JSON.null
    
    let checkLotteryAPI: String = "https://hq-api-dev-01.glo.or.th/lotterycheck/number/check"
    
    let loadingView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Get the view from navigation
        if let navigation = self.navigationController?.view {
            self.loadingView.frame = navigation.bounds
            self.loadingView.backgroundColor = UIColor.black
            self.loadingView.alpha = 0.5
            
            let loadingView: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
            loadingView.color = UIColor.white
            loadingView.center = self.loadingView.center
            loadingView.startAnimating()
            
            self.loadingView.addSubview(loadingView)
            navigation.addSubview(self.loadingView)
            
            // Preload, but hidden
            self.loadingView.isHidden = true
        }
        
        self.btnCheck.addTarget(self, action: #selector(self.btnCheckDidTap(_:)), for: .touchUpInside)
        
        self.loadLotteryResult()
    }
    
    func loadLotteryResult() {
        guard let url = URL(string: apiPath) else { return }
        
        let parameters: [String: Any] = [
            "date" : "01",
            "month" : "09",
            "year" : "2019"
        ]
        
        let header: HTTPHeaders = [
            "appId" : "GENERAL_IOS_APP"
        ]
        
        Alamofire.request(url,
                          method: .post,
                          parameters: parameters,
                          encoding: JSONEncoding.default,
                          headers: header).responseJSON { (response) in
                            
                            if let statusCode = response.response?.statusCode {
                                if statusCode == 200 {
                                    if let responseResult = response.result.value {
                                        let json = JSON(responseResult)
                                        self.lotteryResultDataJson = json["result"]["data"]
                                        self.tableView.reloadData()
                                    }
                                }
                            }
        }
    }
    
    @IBAction func btnCheckDidTap(_ sender: Any) {
        self.txtLotnum.resignFirstResponder()
        self.checkLottery()
    }
    
    func checkLottery() {
        guard let number = self.txtLotnum.text else { return }
        
        guard let url = URL(string: self.checkLotteryAPI) else { return }
        
        let parameters: [String: Any] = [
            "number" : [
                [
                    "lottery_num" : number,
                ]
            ],
            "date" : "01",
            "month" : "09",
            "year" : "2019"
        ]
        
        let header: HTTPHeaders = [
            "appId" : "GENERAL_IOS_APP"
        ]
        
        self.loadingView.isHidden = false
        
        Alamofire.request(url,
                          method: .post,
                          parameters: parameters,
                          encoding: JSONEncoding.default,
                          headers: header).responseJSON { (response) in
                            
                            self.loadingView.isHidden = true
                            
                            if let statusCode = response.response?.statusCode {
                                if statusCode == 200 {
                                    if let responseResult = response.result.value {
                                        let json = JSON(responseResult)
                                        
                                        if let resultJson = json["result"].arrayValue.first {
                                            
                                            let statusType = resultJson["statusType"].intValue
                                            var message: String = ""
                                            switch statusType {
                                            case 0:
                                                message = "ไม่พบข้อมูล"
                                                break
                                            case 1:
                                                message = "ถูกรางวัล"
                                                let statusData = resultJson["status_data"]
                                                if let reward = statusData.arrayValue.first {
                                                    message = message + "\n" + reward["reward"].stringValue
                                                }
                                                break
                                            case 2:
                                                message = "ไม่ถูกรางวัล"
                                                break
                                            case 3:
                                                message = "แจ้งหาย"
                                                break
                                            case 4:
                                                message = "ถูกรางวัล (แจ้งหาย)"
                                                break
                                            default:
                                                break
                                            }
                                            
                                            let alert = UIAlertController.init(title: "ผลการตรวจรางวัล", message: message, preferredStyle: UIAlertController.Style.alert)
                                            
                                            alert.addAction(UIAlertAction.init(title: "ปิด", style: UIAlertAction.Style.cancel, handler: { (status) in
                                                    print("Alert did close")
                                            }))
                                            
                                            self.present(alert, animated: true) {
                                                print("Alert did appear")
                                            }
                                        }
                                    }
                                }
                            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let section = indexPath.section
        let row = indexPath.row
        
        var numberArrayJson: JSON = JSON.null
        switch section {
        case 0:
            numberArrayJson = self.lotteryResultDataJson["first"]["number"]
        case 1:
            numberArrayJson = self.lotteryResultDataJson["second"]["number"]
        case 2:
            numberArrayJson = self.lotteryResultDataJson["third"]["number"]
        case 3:
            numberArrayJson = self.lotteryResultDataJson["fourth"]["number"]
        case 4:
            numberArrayJson = self.lotteryResultDataJson["fifth"]["number"]
        default:
            break
        }
        
        cell.textLabel?.text = numberArrayJson[row]["value"].stringValue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return self.lotteryResultDataJson["first"]["number"].count
        case 1:
            return self.lotteryResultDataJson["second"]["number"].count
        case 2:
            return self.lotteryResultDataJson["third"]["number"].count
        case 3:
            return self.lotteryResultDataJson["fourth"]["number"].count
        case 4:
            return self.lotteryResultDataJson["fifth"]["number"].count
        default:
            return 0
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if self.lotteryResultDataJson != JSON.null {
            return 5
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title: String = ""
        switch section {
        case 0:
            title = "รางวัลที่ 1"
            break
        case 1:
            title = "รางวัลที่ 2"
            break
        case 2:
            title = "รางวัลที่ 3"
            break
        case 3:
            title = "รางวัลที่ 4"
            break
        case 4:
            title = "รางวัลที่ 5"
            break
        default:
            break
        }
        return title
    }
    
    // Will conflict Test changes...
    
}

