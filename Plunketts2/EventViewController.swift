//
//  EventViewController.swift
//  Plunketts2
//
//  Created by Eanna Boland on 06/05/2017.
//  Copyright © 2017 Eanna Boland. All rights reserved.
//

import UIKit
import MapKit

class EventViewController: UIViewController {

    var event: Event?
    
    //MARK: Properties
    @IBOutlet weak var eventsMap: MKMapView!
    @IBOutlet weak var videoview: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        videoview.allowsInlineMediaPlayback = true
        
        videoview.loadHTMLString("<iframe src=\"https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2Fplunketts%2Fvideos%2F1178501438892062%2F&show_text=0&width=560\" width=\"\(videoview.frame.width)\" height=\"\(videoview.frame.height)\" style=\"border:none;overflow:hidden\" scrolling=\"no\" frameborder=\"0\" allowTransparency=\"true\" allowFullScreen=\"true\"></iframe>", baseURL: nil)
            
    
            
            //Maps
            // set initial location in Martin Savage Park
            let location = CLLocationCoordinate2DMake(53.3740831, -6.3261881)
            
            let span = MKCoordinateSpanMake(0.05, 0.05)
            
            let region = MKCoordinateRegion (center: location, span: span)
            
            eventsMap.setRegion(region, animated: true)
            
            //pin
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = "St. Oliver Plunkett Eoghan Ruadh"
            annotation.subtitle = "Martin Savage Park"
            
            eventsMap.addAnnotation(annotation)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

