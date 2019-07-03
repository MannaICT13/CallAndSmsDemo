//
//  ViewController.swift
//  CallAndSmsDemo
//
//  Created by USER on 2/1/19.
//  Copyright © 2019 mCubes. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController,MFMessageComposeViewControllerDelegate{

    @IBOutlet weak var txtNumber: UITextField!
    
    @IBOutlet weak var txtView: UITextView!
    
  
    
    @IBAction func addAcction(_ sender: Any) {
        
        
    }
    
   
    
    override func viewDidLoad() {
        
        txtView.layer.cornerRadius = 10.0
        txtView.layer.masksToBounds = true
        
        super.viewDidLoad()
        
        
       
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        
    }
       deinit{
            
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
              NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
            
            
        }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.view.endEditing(true){
        view.frame.origin.y = 0
        }
    }
    

    
    @IBAction func nextAction(_ sender: Any) {
        
        performSegue(withIdentifier: "nextVC", sender: self)
        
        
    }
    
    
    
    @IBAction func callOnAction(_ sender: Any) {
        
        let url:NSURL = URL(string: "TEL://"+self.txtNumber.text!)! as NSURL
        
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        
        
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendOnAction(_ sender: Any) {
        
        if MFMessageComposeViewController.canSendText(){
            
            let controller = MFMessageComposeViewController()
            
            controller.body = self.txtView.text
            controller.recipients = [self.txtNumber.text!]
            controller.messageComposeDelegate = self
            
            self.present(controller, animated: true, completion: nil)
            
            
            
            
            
            
        }
        
        
        
    }
   
    
    
    @objc func keyboardWillAppear(){
        
        view.frame.origin.y = -250
        
        
    }
   
    
}





















