//
//  UIStoryBoardExtension.swift
//  FounderSF
//
//  Created by tatsuro-y on 2015/02/28.
//  Copyright (c) 2015年 FounderSF. All rights reserved.
//

import UIkit

extension UIStoryboard {
    class func presentEntryDisplayView(parentView: UIViewController) {
        moveTo("EntryDisplay", storyboardID: "EntryDisplayViewController", view: parentView)
    }
    
    class func presentFounderTinderView(parentView: UIViewController) {
        moveTo("FounderTinder", storyboardID: "FounderTinderViewController", view: parentView)
    }
    
    
    class func presentFounderTinderNavigationView(parentView: UIViewController) {
        //FIX
        //when move to navigation controller, view will be blacked out
        moveTo("FounderTinder", storyboardID: "FounderInvestorTinderNavigationController", view: parentView)
    }
    
    class func presentInvestorTinderView(parentView: UIViewController){
      moveTo("InvestorTinder", storyboardID: "InvestorTinderViewController", view: parentView)
    }
    
    class func presentMessageViewController(paretView: UIViewController){
        moveTo("Message", storyboardID: "MessageViewController", view: paretView)
    }
    
    class func presentMatchingPeopleListViewController(parentView: UIViewController){
        moveTo("MatchingPeopleList", storyboardID: "MatchingPeopleListNavigationController", view: parentView)
    }
  
    class func moveTo(storyboardName:String, storyboardID:String, view:UIViewController){
        let storyboard:UIStoryboard = UIStoryboard(name: storyboardName, bundle: NSBundle.mainBundle())
        let distinationView: UIViewController = storyboard.instantiateViewControllerWithIdentifier(storyboardID) as UIViewController
        view.presentViewController(distinationView, animated: true, completion: nil)
    
    }
  
}