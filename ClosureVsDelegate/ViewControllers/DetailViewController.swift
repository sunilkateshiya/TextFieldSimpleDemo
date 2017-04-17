//
//  DetailViewController.swift
//  ClosureVsDelegate
//
//  Created by iFlame on 11/04/17.
//  Copyright © 2017 IFlame. All rights reserved.
//

import UIKit

protocol PrintingDelegate {
    func printMyDescription()
}

class DetailViewController: UIViewController {

    var stringMessage : String?
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var buttonBack: UIButton!
    @IBOutlet var buttonNext: UIButton!
    @IBOutlet var activityIndi: UIActivityIndicatorView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        textField.text = stringMessage
        
        let manager = NetworkManager()
        print("\n\nResult == Started", Date())
        activityIndi.startAnimating()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        
        let result = manager.downloadDataFromUrl(url: URL(string: "http://www.tutorialspoint.com/swift/swift_tutorial.pdf")!)
        
        print("Result == END", Date())
        
        
        //DispatchQueue.main.asyncAfter(deadline: .now() + 5 ) {
            self.activityIndi.stopAnimating()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        //}
        
        print("\n\nResult == >", result)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func backAction() {
        
        let previousController = self.navigationController?.popViewController(animated: true)
        
        if (previousController?.isKind(of: HomeViewController.self)) == true{
            let myHome = previousController as! HomeViewController
            print("my Home == >> \(myHome)")
            
        }
        
        if let myHome = self.navigationController?.topViewController as? HomeViewController {
            myHome.stringMessage = textField.text
        }
    }

}
