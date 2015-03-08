//
//  MuchingAlertController.swift
//  FounderSF
//
//  Created by tatsuro-y on 2015/03/06.
//  Copyright (c) 2015年 FounderSF. All rights reserved.
//

import UIkit

class MuchingAlertController{
   
    class func alert(selfview: UIViewController, name: String){
    //1. Create the alert controller.
    var message =  "You and \(name) both are interested each other."
    var alert = UIAlertController(title: "Mached!", message: message, preferredStyle: .Alert)
    
    //3. Grab the value from the text field, and print it when the user clicks OK.
    alert.addAction(UIAlertAction(title: "Keep Going", style: .Default, handler: { (action) -> Void in
        //do nothing
        println("keep going")
    }))
        
    alert.addAction(UIAlertAction(title: "Send Message", style: .Default, handler: { (action) -> Void in
        //go to message view
        UIStoryboard.presentMessageViewController(selfview)
        println("send message")
    }))

    // 4. Present the alert.
    selfview.presentViewController(alert, animated: true, completion: nil)
    }
}