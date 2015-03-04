//
//  UIStoryBoardExtension.swift
//  FounderSF
//
//  Created by tatsuro-y on 2015/02/28.
//  Copyright (c) 2015年 FounderSF. All rights reserved.
//

import UIkit

extension UIStoryboard {
    class func presentEntryDisplayView(selfView: UIViewController) {
        moveTo("EntryDisplay", storyboardID: "EntryDisplayViewController", view: selfView)
    }
    
    class func presentFounderInvestorTinderView(selfView: UIViewController) {
        moveTo("FounderInvestorTinder", storyboardID: "FounderTinderViewController", view: selfView)
    }
    
    
    class func presentFounderInvestorTinderNavigationView(selfView: UIViewController) {
        //FIX
        //when move to navigation controller, view will be blacked out
        moveTo("FounderInvestorTinder", storyboardID: "FounderInvestorTinderNavigationController", view: selfView)
    }
  
    class func moveTo(storyboardName:String, storyboardID:String, view:UIViewController){
        let storyboard:UIStoryboard = UIStoryboard(name: storyboardName, bundle: NSBundle.mainBundle())
        let distinationView: UIViewController = storyboard.instantiateViewControllerWithIdentifier(storyboardID) as UIViewController
        view.presentViewController(distinationView, animated: true, completion: nil)
    
    }
  
}