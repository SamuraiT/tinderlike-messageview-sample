//
//  CommonNavigationBarViewConroller.swift
//  FounderSF
//
//  Created by tatsuro-y on 2015/03/06.
//  Copyright (c) 2015年 FounderSF. All rights reserved.
//

class CommonNavigationBarViewConroller: UINavigationController,UINavigationBarDelegate{
   
    func setNavigationBar(title: String, parentView: UIViewController){
        // Offset by 20 pixels vertically to take the status bar into account
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 20, parentView.view.frame.size.width, 44))
        //navigationBar.opaque = true
        
        //add blur effect
        let blurEffect = UIBlurEffect(style: .Light)
        var visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = navigationBar.bounds
        visualEffectView.autoresizingMask = .FlexibleHeight | .FlexibleWidth
        navigationBar.delegate = self;
        navigationBar.addSubview(visualEffectView)
        
        // Create a navigation item with a title
        let navigationItem = UINavigationItem()
        navigationItem.title = title
        
        // Create left and right button for navigation item
        let leftButton = UIBarButtonItem(image: UIImage(named: "menu"), style: UIBarButtonItemStyle.Plain, target: self, action: "menuButtonTapped:")
        let rightButton = UIBarButtonItem(image: UIImage(named: "chat"), style: UIBarButtonItemStyle.Plain, target: self, action: "chatButtonTapped:")
        //let rightButton = UIBarButtonItem(title: "Right", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        
        // Create two buttons for the navigation item
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
        
        // Assign the navigation item to the navigation bar
        navigationBar.items = [navigationItem]
        
        // Make the navigation bar a subview of the current view controller
        parentView.view.addSubview(navigationBar)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func chatButtonTapped(button: UIButton){
        UIStoryboard.presentMatchingPeopleListViewController(self)
    }
    
    func menuButtonTapped(button: UIButton){
        println("menue tapped")
    }
}
