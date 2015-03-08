//
//  PersonCell.swift
//  FounderSF
//
//  Created by tatsuro-y on 2015/03/07.
//  Copyright (c) 2015年 FounderSF. All rights reserved.
//

import UIkit

class PersonCell: UITableViewCell{
    
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var professionalHeadline: UILabel!

    func configureForPerson(person: Person){
        personImageView = Person.circleImageView(person.imageURL, personImageView: personImageView, side: personImageView.frame.height)
        name.text = "\(person.firstName) \(person.lastName)"
        professionalHeadline.text = person.professionalHeadline
    }

}