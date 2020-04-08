//
//  ViewController.swift
//  ApiCallWithAlamofire
//
//  Created by ferhan akkan on 8.04.2020.
//  Copyright © 2020 ferhan akkan. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    let baseUrl = "https://jsonplaceholder.typicode.com"
        
    @IBAction func buttonPressed(_ sender: UIButton) {
        switch sender.currentTitle! {
        case "Get":
            AF.request("\(baseUrl)/posts", method: .get).responseJSON { response in
                if let error = response.error {
                    print(error)
                } else {
                    print(response)
                }
            }
            
        case "Post":
            let params:[String : Any] = ["title":"TestPost", "body":"TestPost2", "userId":22]
            
            AF.request("\(baseUrl)/posts", method: .post, parameters: params).responseJSON { response in
                if let error = response.error {
                    print(error)
                } else {
                    print(response)
                }
            }
            
            
        case "Put":
            let params:[String : Any] = ["title":"TestPut", "body":"TestPut2", "userId":40]

            AF.request("\(baseUrl)/posts/1", method: .put, parameters: params).responseJSON { response in
                if let error = response.error {
                    print(error)
                } else {
                    print(response)
                }
            }
            
            
        case "Delete":
            AF.request("\(baseUrl)/posts/1", method: .delete).responseJSON { response in
                if let error = response.error {
                    print(error)
                } else {
                    print(response)
                }
            }
        default:
            return
        }
    }
    


}

