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
            vision: "The mission of Facebook is to all about the sharing and connections that are now ... Get complete information about Facebook's mission and vision, and the 20 ...",
            recommended_by: ""
        )
        self.view.addSubview(swipeView1)
        
        let swipeView2 = createSwipeView(
            photoURL[1],
            firstName: "Bill", lastName: "Gates",
            professionalHeadlineText: "business magnate, philanthropist, investor, computer programmer, and inventor",
            vision: "At Microsoft, our mission is to enable people and businesses throughout the world to realize their full potential. We consider our mission statement a commitment ...",
            recommended_by: ""
        )
        self.view.insertSubview(swipeView2, belowSubview: swipeView1)
        
        let swipeView3 = createSwipeView(
            photoURL[2],
            firstName: "Larry", lastName: "Page",
            professionalHeadlineText: "computer scientist and internet entrepreneur who cofounded Google Inc. with Sergey Brin, and is ..",
            vision: "Google's mission is to organize the world's information and make it universally accessible and useful. Our company has packed a lot into a relatively young life. Since Google was founded in 1998, we've grown to serve millions of people around the world.",
            recommended_by: ""
        )
        self.view.insertSubview(swipeView3, belowSubview: swipeView2)
    }
    
    func createSwipeView(
            url: String, firstName: String, lastName: String,
            professionalHeadlineText: String, vision: String,
            recommenders: Array<String>) -> UIView {
        //set option for Swipe View
        let options = MDCSwipeToChooseViewOptions()
        options.delegate = self
        options.likedText = "Invest"
        options.likedColor = UIColor.redColor()
        options.nopeText = "Later"
        options.nopeColor = UIColor.blueColor()

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
        let personImageView_x = 10.0 as CGFloat
        let personImageView_y = 10.0 as CGFloat
        let personImageViewWidth = swipeViewWidth / 3.0 - 10.0 as CGFloat
        let personImageViewHeight = swipeViewHeight / 3.0 - 10.0 as CGFloat
        let personImageView = createPersonImageView(
            url,
            personCGRect: CGRect(
                x: personImageView_x, y: personImageView_y,
                width: personImageViewWidth, height: personImageViewHeight)
        )
        swipeView.insertSubview(personImageView, atIndex: 0)
      
        let nameLabel_x = personImageViewWidth + 20 as CGFloat
        let nameLabel_y = 10.0 as CGFloat
        let nameLabelWidth = swipeViewWidth * 2 / 3 - 20 as CGFloat
        let nameLabelHeight = 25.0 as CGFloat
        let nameLabel = createCommonHeaderLabel("\(firstName) \(lastName)", fontSize: 22,
            Rectangle: CGRect(
                x: nameLabel_x, y: nameLabel_y,
                width: nameLabelWidth, height: nameLabelHeight)
        )
        swipeView.insertSubview(nameLabel, atIndex: 0)
      
        let headlineLabel_x = nameLabel_x
        let headlineLabel_y = nameLabelHeight + 5
        let headlineLabelWidth = nameLabelWidth
        let headlineLabelHeight = personImageViewHeight - nameLabelHeight - nameLabel_y
        let professionalHeadLine = createCommonBodyTextLabel(
            professionalHeadlineText, numberOfLines: 4,
            Rectangle: CGRect(
                x: headlineLabel_x, y: headlineLabel_y,
                width: headlineLabelWidth, height: headlineLabelHeight)
        )
        swipeView.insertSubview(professionalHeadLine, atIndex: 0)
        
        let visionHeader_x = personImageView_x
        let visionHeader_y = personImageViewHeight + 15
        let visionHeaderWidth = swipeViewWidth
        let visionHeaderHeight = nameLabelHeight
        let visionHeader = createCommonHeaderLabel("Vision", fontSize: 18,
            Rectangle: CGRect(x: visionHeader_x, y: visionHeader_y,
            width: visionHeaderWidth, height: visionHeaderHeight))
        swipeView.insertSubview(visionHeader, atIndex: 0)
      
        let vision_x = personImageView_x
        let vision_y = visionHeader_y + visionHeaderHeight
        let visionWidth = swipeViewWidth
        let visionHeight = personImageViewHeight - visionHeaderHeight
        let visionLabel = createCommonBodyTextLabel(
                vision, numberOfLines: 2,
                Rectangle:  CGRect(x: vision_x, y: vision_y,
                width: visionWidth, height: visionHeight))
        swipeView.insertSubview(visionLabel, atIndex: 0)
        
        let recommendedLabel_x = personImageView_x
        let recommendedLabel_y = vision_y + visionHeight + 10
        let recommendedLabelWidth = swipeViewWidth
        let recommendedLabelHeight = nameLabelHeight
        let recommenededLabel = createCommonHeaderLabel("Recommended by",
            fontSize: 18.0, Rectangle:
            CGRect(x: recommendedLabel_x, y: recommendedLabel_y,
                width: recommendedLabelWidth, height: recommendedLabelHeight))
        swipeView.insertSubview(recommenededLabel, atIndex: 0)
       
        let recommender_x = personImageView_x
        let recommender_y = recommendedLabel_y + recommendedLabelHeight + 10
        let recommenderWidth = swipeViewWidth
        let recommenderHeight = personImageViewHeight - recommendedLabelHeight - 10
        let recommenderImageViews = createRecommenderImageView(recommenders,
            Rectangle: CGRect(x: recommender_x, y: recommender_y, width: recommenderWidth, height: recommenderHeight))
        for recommenderImageView in recommenderImageViews{
            swipeView.insertSubview(recommenderImageView, atIndex: 0)
        }
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
    
    func createCommonBodyTextLabel(body: String, numberOfLines: Int, Rectangle: CGRect) -> UILabel{
        let bodyTextLabel = UILabel(frame: Rectangle)
        bodyTextLabel.numberOfLines = numberOfLines
        bodyTextLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        bodyTextLabel.text = body
        return bodyTextLabel
    }

    func createCommonHeaderLabel(header: String, fontSize: CGFloat, Rectangle: CGRect) -> UILabel{
        let headerLabel = UILabel(frame: Rectangle)
        headerLabel.text = header
        headerLabel.font = UIFont.boldSystemFontOfSize(fontSize)
        return headerLabel
    }
    
    func createRecommenderImageView(recommenders: Array<String>, Rectangle: CGRect) -> Array<UIImageView>{
        var recommenderImageViews = [UIImageView]()
        var x = Rectangle.minX
        var y = Rectangle.minY
        var width = Rectangle.width / 6
        if recommenders.count > 6 {
            width = Rectangle.width / CGFloat(recommenders.count)
        }
        
        var height = width // for drawing circle Image the frame should be square
        
        for recommender in recommenders{
            recommenderImageViews.append(
                createPersonImageView(recommender,
                personCGRect: CGRect(x: x, y: y, width: width, height: height))
            )
            x += width + 10
        }
        return recommenderImageViews
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
