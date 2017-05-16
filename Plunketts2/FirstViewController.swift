//
//  FirstViewController.swift
//  Plunketts2
//
//  Created by Eanna Boland on 06/05/2017.
//  Copyright © 2017 Eanna Boland. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
     //MARK: Arrays
        let teamArray = ["Senior Hurlers","Intermediate Hurlers","Junior Hurlers"]
        let imageArray = ["Adamstown","AIB","Ballinteer St. Johns"]
    
    
     //MARK: Properties
    
    @IBOutlet weak var teamText: UITextField!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var teamPhoto: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        // Handle the text field’s user input through delegate callbacks.
        teamText.delegate = self
    }

    
    
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        teamLabel.text = textField.text
    }
    
    
    
 //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        teamPhoto.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    

    

    //MARK: Actions
    
    @IBAction func picker(_ sender: UITapGestureRecognizer) {
        
        // Hide the keyboard.
        teamText.resignFirstResponder()
        
        // If image is clicked.
        print("Image pressed 👍")
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }

    
    
    @IBAction func setDefaultText(_ sender: UIButton) {
         teamLabel.text = "Senior Hurlers"
    }
    
 
    
}

