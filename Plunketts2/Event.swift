//
//  Event.swift
//  Plunketts2
//
//  Created by Eanna Boland on 29/05/2017.
//  Copyright © 2017 Eanna Boland. All rights reserved.
//

import Foundation


struct  DynamicEvent{
    
    let country: String
    let eventTitle: String
    let description: String
    let title: String
    let imageName: String
    
    init(country: String, eventTitle: String, description: String, title: String, imageName: String) {
        self.country = country
        self.eventTitle = eventTitle
        self.description = description
        self.title = title
        self.imageName = imageName
    }
    
}

//let eventImages = UIImage(named: events[indexPath.row].eventName!)

extension DynamicEvent {
    static var testData: [DynamicEvent] {
        return [
            DynamicEvent(country: "Phoenix Park", eventTitle: "Darkness into Light", description: "This event will start in the clubhouse in aid of Pieta House and make our way to the Phoenix Park. There will be a light breakfast in the club after.", title: "\(Lorem.name)'s Villa", imageName: "1"),
            DynamicEvent(country: "Clubhouse", eventTitle: "Mind Matters", description: "A special charm is given by the dark rectangular box above the main entrance.", title: "\(Lorem.name)'s Villa", imageName: "4"),
            DynamicEvent(country: "Phoenix Park", eventTitle: "Run-A-Muck", description: "A special charm is given by the dark rectangular box above the main entrance.", title: "\(Lorem.name)'s Villa", imageName: "4"),
            DynamicEvent(country: "Clubhouse", eventTitle: "New Years Ball", description: "A special charm is given by the dark rectangular box above the main entrance.", title: "\(Lorem.name)'s Villa", imageName: "4")
        ]
    }
}
