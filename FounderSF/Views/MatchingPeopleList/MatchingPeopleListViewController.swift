//
//  MuchingPeopleListViewController.swift
//  FounderSF
//
//  Created by tatsuro-y on 2015/03/07.
//  Copyright (c) 2015年 FounderSF. All rights reserved.
//

import UIkit


class MatchingPeopleListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    
    var people = [Person]()
    
    struct TableView {
        struct CellIdentifiers {
            static let PersonCell = "PersonCell"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    // MARK: Table View Data Source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableView.CellIdentifiers.PersonCell, forIndexPath: indexPath) as PersonCell
        //cell.configureForPerson(people[indexPath.row])
        return cell
    }
    
    // Mark: Table View Delegate
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        println(people[indexPath.row])
        //let selectedPerson = people[indexPath.row]
        //delegate?.personSelected(selectedPerson)
    }
    
}