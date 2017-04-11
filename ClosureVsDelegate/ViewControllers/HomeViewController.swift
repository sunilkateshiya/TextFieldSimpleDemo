//
//  HomeViewController.swift
//  ClosureVsDelegate
//
//  Created by iFlame on 11/04/17.
//  Copyright © 2017 IFlame. All rights reserved.
//

import UIKit


extension UIViewController {
    
    var activityIndicatorTag: Int {
        return 999999
    }
    
    //Previous code
    func startActivityIndicator( _ style: UIActivityIndicatorViewStyle = .gray,
        location: CGPoint? = nil) {
        
        let loc = location ?? self.view.center
        
        //Ensure the UI is updated from the main thread
        
        //in case this method is called from a closure
        
        DispatchQueue.main.async(execute: {
            
            //Create the activity indicator
            
            let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: style)
            //Add the tag so we can find the view in order to remove it later
            
            activityIndicator.tag = self.activityIndicatorTag
            //Set the location
            
            activityIndicator.center = loc
            activityIndicator.hidesWhenStopped = true
            //Start animating and add the view
            
            activityIndicator.startAnimating()
            self.view.addSubview(activityIndicator)
        })
    }
    
    //Previous code
    
    
    func stopActivityIndicator() {
        
        //Again, we need to ensure the UI is updated from the main thread!
        DispatchQueue.main.async(execute: {
            //Here we find the `UIActivityIndicatorView` and remove it from the view
            
            if let activityIndicator = self.view.viewWithTag(self.activityIndicatorTag) as? UIActivityIndicatorView {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
            /*
            if let activityIndicator = self.view.subviews.filter(
                { $0.tag == self.activityIndicatorTag}).first as? UIActivityIndicatorView {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }*/
        })
    }
}


class HomeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textField : UITextField!
    @IBOutlet var buttonNext: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.textField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.startActivityIndicator()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { 
            self.stopActivityIndicator()
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
}

extension HomeViewController {
    //MARK:- UITextFieldDelegate
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField){
        
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool{
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField){
        
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason){
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        return true
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool{
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        return true
    }
}

