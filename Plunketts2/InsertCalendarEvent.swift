//
//  InsertCalendarEvent.swift
//  Plunketts2
//
//  Created by Eanna Boland on 19/05/2017.
//  Copyright © 2017 Eanna Boland. All rights reserved.
//

import Foundation
import UIKit
import EventKit

class InsertCalendarEvent: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        // 1
        let eventStore = EKEventStore()
        
        // 2
        
        switch EKEventStore.authorizationStatus(for: EKEntityType.event){
        //.authorizationStatusForEntityType(EntityTypeEvent) {
        case .authorized:
            insertEvent(eventStore)
        case .denied:
            print("Access denied")
        case .notDetermined:
            // 3
            eventStore.requestAccess(to: EKEntityType.event, completion:
                {[weak self] (granted: Bool, error: NSError!) -> Void in
                    if granted {
                        self!.insertEvent(eventStore)
                    } else {
                        print("Access denied")
                    }
                    } as! EKEventStoreRequestAccessCompletionHandler)
        default:
            print("Case Default")
        }
        
    }
    
    
    
    //put details in calendar
    func insertEvent(_ store: EKEventStore) {
        // 1
        let calendars = store.calendars(for: EKEntityType.event)
        
        
        
        for calendar in calendars {
            // 2
            if calendar.title == "ioscreator" {
                // 3
                let startDate = NSDate()
                // 2 hours
                let endDate = startDate.addingTimeInterval(2 * 60 * 60)
                
                // 4
                // Create Event
                let event = EKEvent(eventStore: store)
                event.calendar = calendar
                
                event.title = "New Meeting"
                event.startDate = startDate as Date
                event.endDate = endDate as Date
                
                // 5
                // Save Event in Calendar
                do {
                    try store.save(event, span: .thisEvent)
                } catch let error as NSError {
                    print("failed to save event with error : \(error)")
                }
                print("Saved Event")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

