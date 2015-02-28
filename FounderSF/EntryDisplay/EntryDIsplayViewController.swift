//
//  EntryDIsplayView.swift
//  FounderSF
//
//  Created by tatsuro-y on 2015/02/27.
//  Copyright (c) 2015年 FounderSF. All rights reserved.
//

import UIKit

class EntryDisplayViewController: UIViewController {
    
    @IBOutlet weak var investorOutlet: UIButton!
    @IBOutlet weak var founderOutlet: UIButton!
    @IBOutlet weak var entryImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        drawBlurImage(entryImage)
        drawBorderButton(founderOutlet)
        drawBorderButton(investorOutlet)
    }
  
    func drawBlurImage(imageView:UIImageView!){
        let blurEffect = UIBlurEffect(style: .Light)
        var visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = imageView.bounds
        imageView.addSubview(visualEffectView)
    }
    
    func drawBorderButton(outlet: UIButton!){
       outlet.setTitleColor(UIColor.whiteColor(), forState: .Normal)
       outlet.layer.borderWidth = 3
       outlet.layer.borderColor = UIColor.whiteColor().CGColor
       outlet.layer.cornerRadius = 5
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func founderTapped(sender: AnyObject) {
    }
    
    @IBAction func investorTapped(sender: AnyObject) {
    }

}

