//
//  NetworkManager.swift
//  ClosureVsDelegate
//
//  Created by iFlame on 17/04/17.
//  Copyright © 2017 IFlame. All rights reserved.
//

import UIKit

class NetworkManager: NSObject {

    func downloadDataFromUrl(url : URL)-> Any {
        
        let data = NSData.init(contentsOf: url)

        
        
        //let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        //}
        //task.resume()

        //let response  = ["name":"sunil","occupation":"IOS Devloper","Salary":5000] as [String : Any]
        
        return data
    }
    
}
