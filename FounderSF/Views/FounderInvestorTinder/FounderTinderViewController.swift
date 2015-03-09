//
//  FounderInvestorTinderViewController.swift
//  FounderSF
//
//  Created by tatsuro-y on 2015/02/28.
//  Copyright (c) 2015年 FounderSF. All rights reserved.
//

import UIKit

class FounderTinderViewController: UIViewController, MDCSwipeToChooseDelegate{
    
    @IBAction func chatTapped(sender: AnyObject) {
        UIStoryboard.presentMatchingPeopleListViewController(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
    }
    var swipe = 0
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
       
        var photoURL = [
            "http://static.guim.co.uk/sys-images/Technology/Pix/pictures/2007/07/27/facebook-ap-1.jpg",
            "http://t0.gstatic.com/images?q=tbn:ANd9GcToGNSEs_d2aNZQAiaoXTorLMmHaFipqDdA-qGS6dzoraOxij8u3Q",
            "http://static.guim.co.uk/sys-images/Business/Pix/pictures/2007/12/10/page460276.jpg",
        ]
        
        var recommendersURL = [
            "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTmZ-X3fvLI6UTFGQjYrCdC036Fx-FJwzWdF0CjhA-nZzIqvY8m6Q",
            "http://ia.media-imdb.com/images/M/MV5BOTY3NjU3OTY1NV5BMl5BanBnXkFtZTcwNjI3Mjc4MQ@@._V1_SY98_CR1,0,67,98_AL_.jpg",
            "http://investcorrectly.com/wp-content/uploads/2015/03/billackman.jpg",
        ]
        
        let swipeView1 = createSwipeViewForFounder(
            photoURL[0],
            firstName: "Mark", lastName: "zuckerberg",
            professionalHeadlineText: "Founder of Facebook,Software Engineer. founded with Eduardo Luiz Saverin, Chris Hughes...",
            vision: "The mission of Facebook is to all about the sharing and connections that are now ... Get complete information about Facebook's mission and vision, and the 20 ...",
            recommenders: recommendersURL
        )
        self.view.addSubview(swipeView1)
        
        let swipeView2 = createSwipeViewForFounder(
            photoURL[1],
            firstName: "Bill", lastName: "Gates",
            professionalHeadlineText: "business magnate, philanthropist, investor, computer programmer, and inventor",
            vision: "At Microsoft, our mission is to enable people and businesses throughout the world to realize their full potential. We consider our mission statement a commitment ...",
            recommenders: recommendersURL
        )
        self.view.insertSubview(swipeView2, belowSubview: swipeView1)
        
        let swipeView3 = createSwipeViewForFounder(
            photoURL[2],
            firstName: "Larry", lastName: "Page",
            professionalHeadlineText: "computer scientist and internet entrepreneur who cofounded Google Inc. with Sergey Brin, and is ..",
            vision: "Google's mission is to organize the world's information and make it universally accessible and useful. Our company has packed a lot into a relatively young life. Since Google was founded in 1998, we've grown to serve millions of people around the world.",
            recommenders: recommendersURL
        )
        self.view.insertSubview(swipeView3, belowSubview: swipeView2)
    }
 
    /**
    create baisc balnk tinder like swipve view
    */
    func createBaiscSwipeView(Rectangle: CGRect) -> MDCSwipeToChooseView{
        let options = setSwipeViewOptions()
        //create tinder like view
        let swipeView = MDCSwipeToChooseView(
            frame: Rectangle,
            options: options
        )
        swipeView.layer.backgroundColor = UIColor.whiteColor().CGColor
        return swipeView
    }
    
    func setSwipeViewOptions() -> MDCSwipeToChooseViewOptions{
        let options = MDCSwipeToChooseViewOptions()
        options.delegate = self
        options.likedText = "Invest"
        options.likedColor = UIColor.redColor()
        options.nopeText = "Later"
        options.nopeColor = UIColor.blueColor()
        return options
    }

    /**
    create swipe view for investor which founders will appear
    HACK: this func should be refactored
    */
    func createSwipeViewForFounder(
            url: String, firstName: String, lastName: String,
            professionalHeadlineText: String, vision: String,
            recommenders: Array<String>) -> UIView {
        //set tinder view's size
        //Since we wanna controll size: make it resizable easily,
        //we set constant variable for each CGRect size
        let swipeViewX = 10 as CGFloat
        let swipeViewY = 100 as CGFloat
        let swipeViewWidth = self.view.bounds.size.width - 20;
        let swipeViewHeight = self.view.bounds.size.height - 300;
        let CGRectForSwipeView = CGRect(
                x: swipeViewX, y: swipeViewY,
                width: swipeViewWidth, height: swipeViewHeight
        )
        let swipeView = createBaiscSwipeView(CGRectForSwipeView)
                
        let personImageView_x = 10.0 as CGFloat
        let personImageView_y = 10.0 as CGFloat
        let personImageViewWidth = swipeViewWidth / 3.0 - 10.0 as CGFloat
        let personImageViewHeight = swipeViewHeight / 3.0 - 10.0 as CGFloat
        let CGRectForPersonImageView = CGRect(
                x: personImageView_x, y: personImageView_y,
                width: personImageViewWidth, height: personImageViewHeight
        )
        let personImageView = createPersonImageView(
            url,
            personCGRect: CGRectForPersonImageView
        )
      
        let nameLabel_x = personImageViewWidth + 20 as CGFloat
        let nameLabel_y = 10.0 as CGFloat
        let nameLabelWidth = swipeViewWidth * 2 / 3 - 20 as CGFloat
        let nameLabelHeight = 25.0 as CGFloat
        let CGRectForNameLabel = CGRect(
                x: nameLabel_x, y: nameLabel_y,
                width: nameLabelWidth, height: nameLabelHeight
        )
        let nameLabel = createCommonHeaderLabel(
            "\(firstName) \(lastName)", fontSize: 22,
            Rectangle: CGRectForNameLabel
        )
      
        let headlineLabel_x = nameLabel_x
        let headlineLabel_y = nameLabelHeight + 5
        let headlineLabelWidth = nameLabelWidth
        let headlineLabelHeight = personImageViewHeight - nameLabelHeight - nameLabel_y
        let CGRectForProfessionalHeadline = CGRect(
                x: headlineLabel_x, y: headlineLabel_y,
                width: headlineLabelWidth, height: headlineLabelHeight
        )
        let professionalHeadLine = createCommonBodyTextLabel(
            professionalHeadlineText, numberOfLines: 4,
            Rectangle: CGRectForProfessionalHeadline
        )
        
        let visionHeader_x = personImageView_x
        let visionHeader_y = personImageViewHeight + 10
        let visionHeaderWidth = swipeViewWidth
        let visionHeaderHeight = nameLabelHeight
        let CGRectForVisionHeader = CGRect(
            x: visionHeader_x, y: visionHeader_y,
            width: visionHeaderWidth, height: visionHeaderHeight
        )
        let visionHeader = createCommonHeaderLabel(
            "Vision", fontSize: 18,
            Rectangle: CGRectForVisionHeader
        )
      
        let vision_x = personImageView_x
        let vision_y = visionHeader_y + visionHeaderHeight
        let visionWidth = swipeViewWidth
        let visionHeight = personImageViewHeight - visionHeaderHeight - 10
        let CGRectForVision = CGRect(
                x: vision_x, y: vision_y,
                width: visionWidth, height: visionHeight
        )
        let visionLabel = createCommonBodyTextLabel(
                vision, numberOfLines: 2,
                Rectangle: CGRectForVision
        )
        
        let recommendedLabel_x = personImageView_x
        let recommendedLabel_y = vision_y + visionHeight
        let recommendedLabelWidth = swipeViewWidth
        let recommendedLabelHeight = nameLabelHeight
        let CGRectForRecommendedLabel = CGRect(
                x: recommendedLabel_x, y: recommendedLabel_y,
                width: recommendedLabelWidth, height: recommendedLabelHeight
        )
        let recommenededLabel = createCommonHeaderLabel(
            "Recommended by",
            fontSize: 18.0, Rectangle:CGRectForRecommendedLabel
        )
       
        let recommender_x = personImageView_x
        let recommender_y = recommendedLabel_y + recommendedLabelHeight + 10
        let recommenderWidth = swipeViewWidth
        let recommenderHeight = personImageViewHeight - recommendedLabelHeight - 10
        let CGRectForRecommender = CGRect(
            x: recommender_x, y: recommender_y,
            width: recommenderWidth, height: recommenderHeight
        )
        let recommenderImageViews = createRecommenderImageView(recommenders,
            Rectangle: CGRectForRecommender
        )
        
        
        swipeView.insertSubview(personImageView, atIndex: 0)
        swipeView.insertSubview(nameLabel, atIndex: 0)
        swipeView.insertSubview(professionalHeadLine, atIndex: 0)
        swipeView.insertSubview(visionHeader, atIndex: 0)
        swipeView.insertSubview(visionLabel, atIndex: 0)
        swipeView.insertSubview(recommenededLabel, atIndex: 0)
        for recommenderImageView in recommenderImageViews{
            swipeView.insertSubview(recommenderImageView, atIndex: 0)
        }
        return swipeView
    }
    
    func createPersonImageView(url: String, personCGRect: CGRect) -> UIImageView{
        let personImageView = UIImageView(frame: personCGRect)
        let imageURL = NSURL(string: url)
        var personImage: UIImage?
        ImageLoader.sharedLoader.imageForUrl(url as NSString, completionHandler:{(image: UIImage?, url: String) in
            personImage = image
            personImageView.image = personImage
            personImageView.layer.cornerRadius = personImageView.frame.size.width / 2;
            personImageView.clipsToBounds = true
        })
        //var err : NSError?
        //if let imageData = NSData(contentsOfURL: imageURL!, options: NSDataReadingOptions.DataReadingUncached, error: &err){
        //    personImage = UIImage(data: imageData)
        //} else {
        //    println(err)
        //    personImage = UIImage(named: "person_placeholder.png")
        //}
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
            likedPeople.append(people[swipe])
            MuchingAlertController.alert(self, name: "he")
            println("Like")
        }
        swipe++;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

var likedPeople = Array<Person>()
