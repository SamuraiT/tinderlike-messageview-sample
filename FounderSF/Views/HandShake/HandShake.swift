//
//  HandShake.swift
//  FounderSF
//
//  Created by tatsuro-y on 2015/03/10.
//  Copyright (c) 2015年 FounderSF. All rights reserved.
//
import UIkit

class handShakeAlertController{
    
    var deal : String?
    var is_dealed = false
    let message : String
    let titleLabel = "Once you handshaked, Fundraising contract will be confirmed! \r\r"
    init(){
        if isUserInvestor == true{
            self.message = self.titleLabel + "This is to confirm I'm in "
        } else {
            self.message = self.titleLabel + "This is to confirm you're in "
        }
    }
    
    func handshakeAlert(selfview: UIViewController, completion: () -> ()){
        
        //1. Create the alert controller.
       
        var alert = UIAlertController(title: "HandShake!", message: self.message, preferredStyle: .Alert)
        
        
        //3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            textField.placeholder = "offer $100k"
        })
       
        alert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { (action) -> Void in
            // do nothing
            self.is_dealed = false
        }))
        
        alert.addAction(UIAlertAction(title: "HandShake", style: .Default, handler: { (action) -> Void in
            //go to message view
            self.is_dealed = true
            let textFields =  alert.textFields as [UITextField]?
            if textFields != nil{
                let textField = textFields![0] as UITextField
                if textField.text != ""{
                    self.deal = self.message + textField.text
                    completion()
                }
            }
            
        }))
        
        // 4. Present the alert.
        selfview.presentViewController(alert, animated: true, completion: nil)
    }
    
    func is_handshaked() -> Bool{
        return self.is_dealed
    }
}

class congratsAlertController{
    
    class func congrats(selfview: UIViewController){
        
        //1. Create the alert controller.
        var alert = UIAlertController(title: "Congrats!", message: "Fundraised! Contract was confirmed!", preferredStyle: .Alert)
        // 4. Present the alert.

        selfview.presentViewController(alert, animated: true, completion: nil)
        
        alert.addAction(UIAlertAction(title: "ok", style: .Default, handler: { (action) -> Void in
            //go to message view
        }))
        
    }
    
}
