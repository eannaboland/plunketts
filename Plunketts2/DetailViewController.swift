//
//  DetailViewController.swift
//  Plunketts2
//
//  Created by Eanna Boland on 29/05/2017.
//  Copyright © 2017 Eanna Boland. All rights reserved.
//

import Foundation
import ElongationPreview
import UIKit
import EventKit


class DetailViewController: ElongationDetailViewController {
    
    var event: DynamicEvent?
    var eventStore = EKEventStore()
    var calendars:Array<EKCalendar> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .black
        tableView.separatorStyle  = .none
        tableView.registerNib(EventCell.self)
        
        
        // get permission
        eventStore.requestAccess(to: EKEntityType.event, completion:
            {(granted, error) in
                if !granted {
                    print("Access to store not granted")
                }
        })
        
        // you need calender's permission for the reminders as they live there
        calendars = eventStore.calendars(for: EKEntityType.event)
      
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(EventCell.self) as EventCell
        cell.event = event
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let appearance = ElongationConfig.shared
        let headerHeight = appearance.topViewHeight + appearance.bottomViewHeight
        let screenHeight = UIScreen.main.bounds.height
        
        print (headerHeight)
        print (screenHeight)
        return screenHeight - headerHeight
    }
    
    

    
}
