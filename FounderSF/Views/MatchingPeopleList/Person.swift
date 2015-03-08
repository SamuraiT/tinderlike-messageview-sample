//
//  Person.swift
//  FounderSF
//
//  Created by tatsuro-y on 2015/03/07.
//  Copyright (c) 2015年 FounderSF. All rights reserved.
//

import UIkit

class Person {

    let firstName: String
    let lastName: String
    let image: UIImage?
    let professionalHeadline : String
    let vision : String
    var recommenders : Array<Person>?
    
    init(firstName: String, lastName: String, image: UIImage?, professionalHeadline: String, vision: String, recommenders: Array<Person>?){
        self.firstName = firstName
        self.lastName = lastName
        self.image = image
        self.professionalHeadline = professionalHeadline
        self.vision = vision
        self.recommenders = recommenders
    }
    
    class func loadImage(url: String) -> UIImage?{
        var _image: UIImage?
        ImageLoader.sharedLoader.imageForUrl(url as NSString, completionHandler:{(image: UIImage?, url: String) in
            _image = image
        })
        return _image
    }

    
    class func founders() -> Array<Person> {
       return [
            Person(firstName: "Mark", lastName: "zuckerberg",
                        image: Person.loadImage("http://static.guim.co.uk/sys-images/Technology/Pix/pictures/2007/07/27/facebook-ap-1.jpg"),
                        professionalHeadline: "Founder of Facebook,Software Engineer. founded with Eduardo Luiz Saverin, Chris Hughes...",
                        vision: "The mission of Facebook is to all about the sharing and connections that are now ... Get complete information about Facebook's mission and vision, and the 20 ...",
                recommenders: []
            ),
            Person(firstName: "Bill", lastName: "Gates",
                image: Person.loadImage("http://t0.gstatic.com/images?q=tbn:ANd9GcToGNSEs_d2aNZQAiaoXTorLMmHaFipqDdA-qGS6dzoraOxij8u3Q"),
                professionalHeadline: "business magnate, philanthropist, investor, computer programmer, and inventor",
                vision: "At Microsoft, our mission is to enable people and businesses throughout the world to realize their full potential. We consider our mission statement a commitment ...",
                recommenders: []
            ),
            Person(firstName: "Larry", lastName: "Page",
                image: Person.loadImage("http://static.guim.co.uk/sys-images/Business/Pix/pictures/2007/12/10/page460276.jpg"),
                professionalHeadline: "computer scientist and internet entrepreneur who cofounded Google Inc. with Sergey Brin, and is ..",
                vision: "Google's mission is to organize the world's information and make it universally accessible and useful. Our company has packed a lot into a relatively young life. Since Google was founded in 1998, we've grown to serve millions of people around the world.",
                recommenders: []
            )
        ]
    }
    
    class func investors() -> Array<Person> {
        return [
           Person(
                firstName: "Warren", lastName: "Buffett",
                image: Person.loadImage("http://static.guim.co.uk/sys-images/Technology/Pix/pictures/2007/07/27/facebook-ap-1.jpg"),
                professionalHeadline: "Investor and philanthropist. He was the most successful investor of the 20th century. Buffett is the ...",
                vision: "",
                recommenders: []
            ),
            Person(
                firstName: "Donald", lastName: "Trump",
                image: Person.loadImage( "http://t0.gstatic.com/images?q=tbn:ANd9GcToGNSEs_d2aNZQAiaoXTorLMmHaFipqDdA-qGS6dzoraOxij8u3Q"),
                professionalHeadline: "Investor, television personality and author",
                vision: "blah blah",
                recommenders: []
            ),
            Person(
                firstName: "Bill", lastName: "Ackman",
                image: Person.loadImage("http://static.guim.co.uk/sys-images/Business/Pix/pictures/2007/12/10/page460276.jpg"),
                professionalHeadline: "Hedge fund manager and philanthropis",
                vision: "He is the founder and CEO of Pershing Square Capital Management LP, a hedge fund management company. He considers himself an activist investor",
                recommenders: []
            )
        ]
    }

}

var people = Person.founders()
