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
    

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        // Handle the text field’s user input through delegate callbacks.

        homeTeamLabel.text = "St. Oliver Plunkett Eoghan Ruadh"
        teamName.text = fixture?.teamName
        awayTeamLabel.text = fixture?.awayTeam
        competitionLabel.text = fixture?.competition
        let teamCrest = UIImage(named: awayTeamLabel.text!)
        awayTeamCrest?.image = teamCrest
        
        
        
        
        //Maps
        // set initial location in Martin Savage Park
        let location = CLLocationCoordinate2DMake(53.3740831, -6.3261881)
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        
        let region = MKCoordinateRegion (center: location, span: span)
        
        fixtureMapView.setRegion(region, animated: true)
        
        //pin
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "St. Oliver Plunkett Eoghan Ruadh"
        annotation.subtitle = "Martin Savage Park"
        
        fixtureMapView.addAnnotation(annotation)
 
        }
        


    
        //
        /*
        GMSServices.provideAPIKey("AIzaSyCBh4cOdxjCqo9rlKzbygph-2IhBo2_VFQ")
        
        let camera = GMSCameraPosition.camera(withLatitude: 53.3740831, longitude: -6.3261881, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        view = mapView
        */
        
        
        
        
        //remove back button text
        //navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    

    
 


