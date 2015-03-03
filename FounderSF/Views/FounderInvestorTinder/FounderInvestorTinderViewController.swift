//
//  FounderInvestorTinderViewController.swift
//  FounderSF
//
//  Created by tatsuro-y on 2015/02/28.
//  Copyright (c) 2015年 FounderSF. All rights reserved.
//

import UIKit

class FounderInvestorTinderViewController: UIViewController, MDCSwipeToChooseDelegate{
    
    @IBOutlet weak var tinderView: UIImageView!
    var swipeCount = 0
    var photoURL = [
        "http://static.guim.co.uk/sys-images/Technology/Pix/pictures/2007/07/27/facebook-ap-1.jpg",
        "http://t0.gstatic.com/images?q=tbn:ANd9GcToGNSEs_d2aNZQAiaoXTorLMmHaFipqDdA-qGS6dzoraOxij8u3Q",
        "http://static.guim.co.uk/sys-images/Business/Pix/pictures/2007/12/10/page460276.jpg",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeView1 = createSwipeView(photoURL[0])
        self.view.addSubview(swipeView1)
        let title = UILabel(frame: CGRect(x: 10, y: 100, width: 310, height: 44))
        
        let swipeView2 = createSwipeView(photoURL[1])
        self.view.insertSubview(swipeView2, belowSubview: swipeView1)
        
        let swipeView3 = createSwipeView(photoURL[2])
        self.view.insertSubview(swipeView3, belowSubview: swipeView2)
    }
    
    func createSwipeView(url: String) -> UIView {
        //set option for Swipe View
        let options = MDCSwipeToChooseViewOptions()
        options.delegate = self
        options.likedText = "Invest"
        options.likedColor = UIColor.greenColor()
        options.nopeText = "Later"
        options.nopeColor = UIColor.redColor()
       
        //set tinder view's size
        let swipeViewX = 10 as CGFloat
        let SwipeViewY = 100 as CGFloat
        let swipeViewWidth = self.view.bounds.size.width - 20;
        let swipeViewHeight = self.view.bounds.size.height - 300;
        
        //create tinder like view
        let swipeView = MDCSwipeToChooseView(
            frame: CGRect(
                x: swipeViewX,
                y: SwipeViewY,
                width: swipeViewWidth,
                height: swipeViewHeight
            ),
            options: options
        )
        let imageURL = NSURL(string: url)
        swipeView.imageView.image = UIImage(data: NSData(contentsOfURL: imageURL!)!)
        return swipeView
    }
    

    
    func view(view: UIView!, wasChosenWithDirection direction: MDCSwipeDirection) {
        if (direction == MDCSwipeDirection.Left) {
            println("Later")
        } else {
            println("Like")
        }
        swipeCount++
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
