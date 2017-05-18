//
//  EventListViewController.swift
//  Plunketts2
//
//  Created by Eanna Boland on 18/05/2017.
//  Copyright © 2017 Eanna Boland. All rights reserved.
//

import Foundation
import UIKit

class EventListViewController: UITableViewController {
    
    //let imageNames = ["Darkness into Light","Mind Matter","New Years Ball"]
    let eventNames = ["Darkness into Light","Mind Matter","New Years Ball"]
    
    var events: [Event] = []
    

    override func viewDidLoad() {
        
        tableView.delegate = self
        //tableView.backgroundColor = UIColor.red
        for eventName in eventNames {
            //let randomEventIndex = Int(arc4random_uniform(UInt32(eventNames.count)))
            let event = Event()
            event.create(eventName: eventName)
            events.append(event)
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventList") as! EventListCell
        
       
        //cell.backgroundColor = UIColor.red
        cell.layoutMargins = UIEdgeInsets.zero
        cell.contentView.layoutMargins.bottom = 20
        
        cell.eventName?.text = events[indexPath.row].eventName
        
        
        let eventImages = UIImage(named: events[indexPath.row].eventName!)
        cell.eventImage?.image = eventImages
 
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

}


class EventListCell: UITableViewCell {
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventName: UILabel!
    
}


class Event {
    
    var eventName: String?
    
    func create(eventName: String?){
        //, date:Date?,time:Date?,location:String?
        
        
        self.eventName = eventName

        //self.date = date
        //self.time = time
        //self.location = location

        
    }
    
    
    
}
