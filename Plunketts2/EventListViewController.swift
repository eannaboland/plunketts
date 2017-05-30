//
//  EventListViewController.swift
//  Plunketts2
//
//  Created by Eanna Boland on 18/05/2017.
//  Copyright © 2017 Eanna Boland. All rights reserved.
//

import Foundation
import UIKit
import ElongationPreview

class EventListViewController: ElongationViewController {
    
    //let imageNames = ["Darkness into Light","Mind Matter","New Years Ball"]
    let eventNames = ["Darkness into Light","Mind Matter","New Years Ball","Run-A-Muck"]
    
    var events: [Event] = []
    var eventDate: String = ""
    var eventTime: String = ""
    

    override func viewDidLoad() {
        
        // Date and Time properties
            //Convert Current date to String
            let currentDate = Date()
            let formatterDate = DateFormatter()
            //formatterDate.dateStyle = .medium
            formatterDate.timeStyle = .short
            formatterDate.dateFormat = "E dd, MMM"
            let result = formatterDate.string(from: currentDate)
            eventDate = result
            
            //Convert Current Time to String
            let formatterTime = DateFormatter()
            formatterTime.dateFormat = "HH:mm"
            let timeResult = formatterTime.string(from: currentDate)
            eventTime = timeResult
            
        tableView.delegate = self
        //tableView.backgroundColor = UIColor.red
        for eventName in eventNames {
            //let randomEventIndex = Int(arc4random_uniform(UInt32(eventNames.count)))
            let event = Event()
            
            event.create(eventName: eventName, eventDate: eventDate, eventTime: eventTime)
            events.append(event)
            
            
            

            
        }
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventList") as! EventListCell
        
       
        //cell.backgroundColor = UIColor.red
        cell.layoutMargins = UIEdgeInsets.zero
        cell.contentView.layoutMargins.bottom = 20
        
        cell.eventName?.text = events[indexPath.row].eventName
        cell.eventDate?.text = events[indexPath.row].eventDate
        cell.eventTime?.text = events[indexPath.row].eventTime
        
        let eventImages = UIImage(named: events[indexPath.row].eventName!)
        cell.eventImage?.image = eventImages
 
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let eventCell = events[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "EventViewController") as! EventViewController
        controller.event = eventCell
        //self.navigationController?.pushViewController(controller, animated: true)
        expand(viewController: controller)
    }
     */
    
    override func openDetailView(for indexPath: IndexPath) {
        let eventCell = events[indexPath.row]

        let controller = DetailViewController(style: UITableViewStyle.grouped)
        expand(viewController: controller)
    }

}


class EventListCell: ElongationCell {
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    
}


class Event {
    
    var eventName: String?
    var eventDate: String?
    var eventTime: String?
    
    func create(eventName: String?,eventDate:String?,eventTime:String?){
        //,location:String?
        
        
        self.eventName = eventName
        self.eventDate = eventDate
        self.eventTime = eventTime
        //self.location = location
    }

}
