//
//  HomeViewController.swift
//  ClosureVsDelegate
//
//  Created by iFlame on 11/04/17.
//  Copyright © 2017 IFlame. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    var stringMessage : String?
    //    {
    //    didSet{
    //        self.textField?.text = stringMessage
    //    }
    //}

    @IBOutlet var textField : UITextField!
    @IBOutlet var buttonNext: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.textField.delegate = self
        self.textField.text = stringMessage
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("stringMessage Will Appear == >>> \(stringMessage)")
        self.textField.text = stringMessage
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //self.startActivityIndicator()
        //DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        //    self.stopActivityIndicator()
        //}
        
        print("stringMessage == Did Appear >>> \(stringMessage)")
        self.textField.text = stringMessage
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
     @IBAction func buttonNextPressed(_ sender: Any){
        
        let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
        let myNextViewController : DetailViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        myNextViewController.stringMessage = self.textField.text
        //myNextViewController.previousViewController = self
        
        self.navigationController?.pushViewController(myNextViewController, animated: true)
    }

    
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
        
        textField.resignFirstResponder()
        
        return true
    }
}

