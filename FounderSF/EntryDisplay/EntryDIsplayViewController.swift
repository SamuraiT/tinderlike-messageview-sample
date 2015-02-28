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
    
    
}

