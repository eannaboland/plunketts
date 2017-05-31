//
//  EventCell.swift
//  Plunketts2
//
//  Created by Eanna Boland on 31/05/2017.
//  Copyright © 2017 Eanna Boland. All rights reserved.
//

import UIKit
import EventKit
import Toaster

class EventCell: UITableViewCell {
    
    @IBOutlet var stackView: UIStackView!
    @IBOutlet weak var AddtoCalendar: UIButton!
    @IBOutlet weak var notInterested: UIButton!
    @IBOutlet weak var interested: UIButton!
    

    var event: DynamicEvent?
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        
        
        
    }
    
    @IBAction func calendarButton(_ sender: Any) {
        
        if (event == nil){ return }
        
        let result = CalendarHelper.addToCalendar(title: event!.eventTitle, notes: event!.description)
        
        if (result) {
            let toast = Toast(text: "Added to Calendar", delay: 1.0, duration: Delay.long)
            ToastView.appearance().cornerRadius = 0
            ToastView.appearance().bottomOffsetPortrait = 0
            //ToastView.appearance().width
            toast.show()
        } else {
            let toast = Toast(text: "Failed to add to Calendar", delay: 1.0, duration: Delay.long)
            ToastView.appearance().cornerRadius = 0
            ToastView.appearance().bottomOffsetPortrait = 0
            //ToastView.appearance().width
            toast.show()
        }

    }
    
}

