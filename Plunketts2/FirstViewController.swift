//
//  FirstViewController.swift
//  Plunketts2
//
//  Created by Eanna Boland on 06/05/2017.
//  Copyright © 2017 Eanna Boland. All rights reserved.
//

import UIKit
import MapKit
import GoogleMaps
import EventKit
import Toaster


class FirstViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    var fixture: Fixture?
    
    
     //MARK: Properties
    @IBOutlet weak var teamPhoto: UIImageView!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var competitionLabel: UILabel!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var awayTeamCrest: UIImageView!
    @IBOutlet weak var fixtureMapView: MKMapView!
    //@IBOutlet weak var googleMapView: GMSMapView!
    @IBOutlet weak var fixtureDateLabel: UILabel!
    @IBOutlet weak var calendarButton: UIButton!
    @IBOutlet weak var fixtureTimeLabel: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        // Handle the text field’s user input through delegate callbacks.
        homeTeamLabel.text = "St. Oliver Plunkett Eoghan Ruadh"
        teamName.text = fixture?.teamName
        awayTeamLabel.text = fixture?.awayTeam
        competitionLabel.text = fixture?.competition
        let teamCrest = UIImage(named: awayTeamLabel.text!)
        awayTeamCrest?.image = teamCrest
        fixtureDateLabel.text = fixture?.date
        fixtureTimeLabel.text = fixture?.time
        
        //Maps
        // set initial location in Martin Savage Park
        let location = CLLocationCoordinate2DMake(53.3740831, -6.3261881)
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        
        let region = MKCoordinateRegion (center: location, span: span)
        
        fixtureMapView.setRegion(region, animated: true)
        
        //Pin
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "St. Oliver Plunkett Eoghan Ruadh"
        annotation.subtitle = "Martin Savage Park"
        
        fixtureMapView.addAnnotation(annotation)
        
        
        //Google Maps functionality
        /*GMSServices.provideAPIKey("AIzaSyCBh4cOdxjCqo9rlKzbygph-2IhBo2_VFQ")

        let camera = GMSCameraPosition.camera(withLatitude: 53.3740831, longitude: -6.3261881, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        view = mapView
        */

        //remove back button text
        //navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
   
        // Do any additional setup after loading the view, typically from a nib.
        
        


    
    }
    
    
    
    //MARK: Share the Fixture Details
    @IBAction func shareButton(_ sender: Any) {
        
        //https://goo.gl/0f4mWS is the FB Run a Muck URL
        let link = NSURL(string: "https://goo.gl/0f4mWS")
        let vc = UIActivityViewController(activityItems: [competitionLabel.text!,link!], applicationActivities: nil)
        self.present(vc, animated: true, completion: nil)
        
    }

    //MARK: Calendar Navigation. Check if authorised
        @IBAction func addCalenderButton(_ sender: Any) {
            
            //Convert the fixtureDate back into a Date Type so it can be used to add the calendar
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E dd, MMM"
            let fixtureDate = dateFormatter.date(from: (fixture?.date)!)
            print (fixtureDate as Any)
            
            
            let title = (fixture?.teamName)! + " vs " + (fixture?.awayTeam)! + "\r\n" + (fixture?.competition)! + "\r\n" + "Location when I code it"
            let notes = (fixture?.competition)! + "\r\n" + "Location when I code it"
            let startDate = NSDate() as Date
            
            let result = CalendarHelper.addToCalendar(title: title, notes: notes, startDate: startDate)
            
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
            
        
            
            //toast.cancel()
   
            /*
            // 1
            let eventStore = EKEventStore()
            //let handler = CalendarHandler ()
            
            // 2
            switch EKEventStore.authorizationStatus(for: EKEntityType.event){
            case .authorized:
                // enable button
                calendarButton.isEnabled = true
                //print("Access authorised")
                
                self.insertEvent(eventStore)
                return
            case .denied:
                calendarButton.isEnabled = false
                print("Access denied")
            // disable button
            case .notDetermined:
                
                // 3
                eventStore.requestAccess(to: EKEntityType.event, completion:
                    {[weak self] (granted: Bool, error: NSError?) -> Void in
                        if granted {
                            // enable button
                            self!.insertEvent(eventStore)
                            } else {
                            // disable button
                            print("Access denied")
                            }
                    }
                )
            default:
                print("Case Default")
            }
            */
        }
    
    
    
    
    //MARK: Function to put details in Calendar
    func insertEvent(_ store: EKEventStore) {
        // 1
        let calendars = store.calendars(for: EKEntityType.event)
     
        for calendar in calendars {
            // 2
            if calendar.title == "Team Name" {
                // 3
                let startDate = NSDate()
             
                // Two hours later
                let endDate = startDate.addingTimeInterval(2 * 60 * 60)
        
                // 4
                // Create Event
                let event = EKEvent(eventStore: store)
                event.calendar = calendar
                event.title = "Fixture Name"
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
    
}
    

    
 


