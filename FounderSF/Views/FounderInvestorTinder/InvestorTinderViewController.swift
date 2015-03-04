//
//  File.swift
//  FounderSF
//
//  Created by tatsuro-y on 2015/03/03.
//  Copyright (c) 2015年 FounderSF. All rights reserved.
//

import UIKit

class InvestorTinderViewController: FounderTinderViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool){
        
        var photoURL = [
            "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTmZ-X3fvLI6UTFGQjYrCdC036Fx-FJwzWdF0CjhA-nZzIqvY8m6Q",
            "http://ia.media-imdb.com/images/M/MV5BOTY3NjU3OTY1NV5BMl5BanBnXkFtZTcwNjI3Mjc4MQ@@._V1_SY98_CR1,0,67,98_AL_.jpg",
            "http://investcorrectly.com/wp-content/uploads/2015/03/billackman.jpg",
        ]
        
        var recommendersURL = [
            "http://static.guim.co.uk/sys-images/Technology/Pix/pictures/2007/07/27/facebook-ap-1.jpg",
            "http://t0.gstatic.com/images?q=tbn:ANd9GcToGNSEs_d2aNZQAiaoXTorLMmHaFipqDdA-qGS6dzoraOxij8u3Q",
            "http://static.guim.co.uk/sys-images/Business/Pix/pictures/2007/12/10/page460276.jpg",
        ]
        
        let swipeView1 = createSwipeViewForFounder(
            photoURL[0],
            firstName: "Warren", lastName: "Buffett",
            professionalHeadlineText: "Investor and philanthropist. He was the most successful investor of the 20th century. Buffett is the ...",
            vision: "",
            recommenders: recommendersURL
        )
        self.view.addSubview(swipeView1)
        
        let swipeView2 = createSwipeViewForFounder(
            photoURL[1],
            firstName: "Donald", lastName: "Trump",
            professionalHeadlineText: "Investor, television personality and author",
            vision: "blah blah",
            recommenders: recommendersURL
        )
        self.view.insertSubview(swipeView2, belowSubview: swipeView1)
        
        let swipeView3 = createSwipeViewForFounder(
            photoURL[2],
            firstName: "Bill", lastName: "Ackman",
            professionalHeadlineText: "Hedge fund manager and philanthropis",
            vision: "He is the founder and CEO of Pershing Square Capital Management LP, a hedge fund management company. He considers himself an activist investor",
            recommenders: recommendersURL
        )
        self.view.insertSubview(swipeView3, belowSubview: swipeView2)
    }
    
    override func setSwipeViewOptions() -> MDCSwipeToChooseViewOptions{
        let options = MDCSwipeToChooseViewOptions()
        options.delegate = self
        options.likedText = "Meet"
        options.likedColor = UIColor.redColor()
        options.nopeText = "Later"
        options.nopeColor = UIColor.blueColor()
        return options
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

 