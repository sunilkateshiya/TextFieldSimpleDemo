//
//   UIViewController+Extension.swift
//  ClosureVsDelegate
//
//  Created by iFlame on 12/04/17.
//  Copyright © 2017 IFlame. All rights reserved.
//

import Foundation
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
