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
        
        let swipeView1 = createSwipeView(
            photoURL[0],
            firstName: "Mark", lastName: "zuckerberg",
            professionalHeadlineText: "Founder of Facebook,Software Engineer. founded with Eduardo Luiz Saverin, Chris Hughes...",
            vision: "",
            recommended_by: ""
        )
        self.view.addSubview(swipeView1)
        
        let swipeView2 = createSwipeView(
            photoURL[1],
            firstName: "Bill", lastName: "Gates",
            professionalHeadlineText: "business magnate, philanthropist, investor, computer programmer, and inventor",
            vision: "",
            recommended_by: ""
        )
        self.view.insertSubview(swipeView2, belowSubview: swipeView1)
        
        let swipeView3 = createSwipeView(
            photoURL[2],
            firstName: "Larry", lastName: "Page",
            professionalHeadlineText: "computer scientist and internet entrepreneur who cofounded Google Inc. with Sergey Brin, and is ..",
            vision: "",
            recommended_by: ""
        )
        self.view.insertSubview(swipeView3, belowSubview: swipeView2)
    }
    
    func createSwipeView(
            url: String, firstName: String, lastName: String,
            professionalHeadlineText: String, vision: String,
            recommended_by: AnyObject) -> UIView {
        //set option for Swipe View
        let options = MDCSwipeToChooseViewOptions()
        options.delegate = self
        options.likedText = "Invest"
        options.likedColor = UIColor.greenColor()
        options.nopeText = "Later"
        options.nopeColor = UIColor.redColor()

        //set tinder view's size
        //Since we wanna controll size: make it resizable easily,
        //we set constant variable for each CGRect size
        let swipeViewX = 10 as CGFloat
        let SwipeViewY = 100 as CGFloat
        let swipeViewWidth = self.view.bounds.size.width - 20;
        let swipeViewHeight = self.view.bounds.size.height - 300;
        
        //create tinder like view
        let swipeView = MDCSwipeToChooseView(
            frame: CGRect(
                x: swipeViewX, y: SwipeViewY,
                width: swipeViewWidth, height: swipeViewHeight),
            options: options
        )
        swipeView.layer.backgroundColor = UIColor.whiteColor().CGColor
        let personImageViewWidth = swipeViewWidth / 3.0 - 10.0 as CGFloat
        let personImageViewHeight = swipeViewHeight / 3.0 - 10.0 as CGFloat
        let personImageView = createPersonImageView(
            url,
            personCGRect: CGRect(
                x: 10.0, y: 10.0,
                width: personImageViewWidth, height: personImageViewHeight)
        )
        swipeView.insertSubview(personImageView, atIndex: 0)
       
        let nameLabel = createNameLabel(
            "Mark", last: "zuckerberg",
            nameCGRect: CGRect(
                x: personImageViewWidth + 20, y: 10.0,
                width: swipeViewWidth * 2 / 3 - 20, height: 25.0)
        )
        swipeView.insertSubview(nameLabel, atIndex: 0)
      
        let headlineLabel_x = nameLabel_x
        let headlineLabel_y = nameLabelHeight + 5
        let headlineLabelWidth = nameLabelWidth
        let headlineLabelHeight = personImageViewHeight - nameLabelHeight - nameLabel_y
        let professionalHeadLine = createProfessionalHeadlineLabel(
            professionalHeadlineText,
            headlineCGRect: CGRect(
                x: headlineLabel_x, y: headlineLabel_y,
                width: headlineLabelWidth, height: headlineLabelHeight)
        )
        swipeView.insertSubview(professionalHeadLine, atIndex: 0)
        //swipeView.imageView.image = UIImage(data: NSData(contentsOfURL: imageURL!)!)
        return swipeView
    }
    
    func createPersonImageView(url: String, personCGRect: CGRect) -> UIImageView{
        let personImageView = UIImageView(frame: personCGRect)
        let imageURL = NSURL(string: url)
        var personImage: UIImage?
        if let imageData = NSData(contentsOfURL: imageURL!){
            personImage = UIImage(data: imageData)
        } else {
            personImage = UIImage(named: "person_placeholder.png")
        }
        personImageView.image = personImage
        personImageView.layer.cornerRadius = personImageView.frame.size.width / 2;
        personImageView.clipsToBounds = true
        return personImageView
    }
    
    func createNameLabel(first: String, last: String, nameCGRect: CGRect) -> UILabel{
        let nameLabel = UILabel(frame: nameCGRect)
        nameLabel.text = "\(first) \(last)"
        nameLabel.font = UIFont.boldSystemFontOfSize(22)
        return nameLabel
    }
   
    func createProfessionalHeadlineLabel(headline: String, headlineCGRect: CGRect) -> UILabel{
        let headlineLabel = UILabel(frame: headlineCGRect)
        headlineLabel.numberOfLines = 4
        headlineLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        headlineLabel.text = headline
        return headlineLabel
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
