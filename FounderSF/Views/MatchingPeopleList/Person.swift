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
    let imageURL: String
    let professionalHeadline : String
    let vision : String
    var recommenders : Array<Person>?
    
    init(firstName: String, lastName: String, imageURL: String, professionalHeadline: String, vision: String, recommenders: Array<Person>?){
        self.firstName = firstName
        self.lastName = lastName
        self.imageURL = imageURL
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
    
    class func circleImageView(url: String, personImageView: UIImageView, side: CGFloat) -> UIImageView{
        ImageLoader.sharedLoader.imageForUrl(url as NSString, completionHandler:{(image: UIImage?, url: String) in
            personImageView.image = image
            personImageView.frame.size.width = side
            personImageView.frame.size.height = side
            personImageView.layer.cornerRadius = personImageView.frame.size.width / 2;
            personImageView.clipsToBounds = true
        })
        return personImageView
    }

    
    class func founders() -> Array<Person> {
        var recommenders = [Person]()
        //Person.investors()
        return [
            Person(firstName: "Mark", lastName: "zuckerberg",
                        imageURL: "http://static.guim.co.uk/sys-images/Technology/Pix/pictures/2007/07/27/facebook-ap-1.jpg",
                        professionalHeadline: "Founder of Facebook,Software Engineer. founded with Eduardo Luiz Saverin, Chris Hughes...",
                        vision: "The mission of Facebook is to all about the sharing and connections that are now ... Get complete information about Facebook's mission and vision, and the 20 ...",
                recommenders: recommenders
            ),
            Person(firstName: "Bill", lastName: "Gates",
                imageURL: "http://t0.gstatic.com/images?q=tbn:ANd9GcToGNSEs_d2aNZQAiaoXTorLMmHaFipqDdA-qGS6dzoraOxij8u3Q",
                professionalHeadline: "business magnate, philanthropist, investor, computer programmer, and inventor",
                vision: "At Microsoft, our mission is to enable people and businesses throughout the world to realize their full potential. We consider our mission statement a commitment ...",
                recommenders: recommenders
            ),
            Person(firstName: "Larry", lastName: "Page",
                imageURL: "http://static.guim.co.uk/sys-images/Business/Pix/pictures/2007/12/10/page460276.jpg",
                professionalHeadline: "computer scientist and internet entrepreneur who cofounded Google Inc. with Sergey Brin, and is ..",
                vision: "Google's mission is to organize the world's information and make it universally accessible and useful. Our company has packed a lot into a relatively young life. Since Google was founded in 1998, we've grown to serve millions of people around the world.",
                recommenders: recommenders
            )
        ]
    }
    
    class func investors() -> Array<Person> {
        var recommenders = [Person]()//Person.founders()
        return [
           Person(
                firstName: "Warren", lastName: "Buffett",
                imageURL:"https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTmZ-X3fvLI6UTFGQjYrCdC036Fx-FJwzWdF0CjhA-nZzIqvY8m6Q",
                professionalHeadline: "Investor and philanthropist. He was the most successful investor of the 20th century. Buffett is the ...",
                vision: "",
                recommenders: recommenders
            ),
            Person(
                firstName: "Donald", lastName: "Trump",
                imageURL: "http://ia.media-imdb.com/images/M/MV5BOTY3NjU3OTY1NV5BMl5BanBnXkFtZTcwNjI3Mjc4MQ@@._V1_SY98_CR1,0,67,98_AL_.jpg",
                professionalHeadline: "Investor, television personality and author",
                vision: "blah blah",
                recommenders: recommenders
            ),
            Person(
                firstName: "Bill", lastName: "Ackman",
                imageURL: "http://investcorrectly.com/wp-content/uploads/2015/03/billackman.jpg",
                professionalHeadline: "Hedge fund manager and philanthropis",
                vision: "He is the founder and CEO of Pershing Square Capital Management LP, a hedge fund management company. He considers himself an activist investor",
                recommenders: recommenders
            )
        ]
    }

}