//
//  ThirdViewController.swift
//  Plunketts2
//
//  Created by Eanna Boland on 16/05/2017.
//  Copyright © 2017 Eanna Boland. All rights reserved.
//

import UIKit
import TwitterKit

class ThirdViewController:  TWTRTimelineViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = TWTRAPIClient()
        //select the twitter handle you want
        self.dataSource = TWTRUserTimelineDataSource(screenName: "plunketts_ie", apiClient: client)
        
        TWTRTweetView.appearance().theme = .dark
    }
}
