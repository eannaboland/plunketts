//
//  Calendar.swift
//  Plunketts2
//
//  Created by Eanna Boland on 31/05/2017.
//  Copyright © 2017 Eanna Boland. All rights reserved.
//

import Foundation
import EventKit
import Toaster


class CalendarHelper {

    static func addToCalendar(title: String, notes: String?, startDate: Date? = Date()) -> Bool{
        
        let eventStore = EKEventStore()
        
        // get permission
        eventStore.requestAccess(to: EKEntityType.event, completion:
            {(granted, error) in
                if !granted {
                    print("Access to store not granted")
                }
        })
        
        let reminder = EKEvent(eventStore: eventStore)
        
        reminder.title = title
        reminder.notes = notes
        reminder.calendar = eventStore.defaultCalendarForNewEvents
        reminder.startDate = startDate!
        reminder.endDate = reminder.startDate.addingTimeInterval(2 * 60 * 60) as Date
        
        do {
            try eventStore.save(reminder, span: .thisEvent, commit: true)
            return true
        } catch let error {
            print("Reminder failed with error \(error.localizedDescription)")
            return false
        }
        
    }

}
