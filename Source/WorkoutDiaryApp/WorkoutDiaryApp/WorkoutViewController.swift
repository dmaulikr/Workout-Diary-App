//
//  WorkoutViewController.swift
//  WorkoutDiaryApp
//
//  Created by Alexander Lindgren on 31/08/16.
//  Copyright © 2016 Alexander Lindgren. All rights reserved.
//

import UIKit

class WorkoutViewController: UIViewController {
    
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var nameTextField: UITextField!
    
    var workout: Workout?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
    
        //Disable the Save button while editing.
        
        saveButton.enabled = false
    
    }
    
    func checkValidWorkoutName() {
        
        //Disable the Save button if the text field is empty.
        
        let text = nameTextField.text ?? ""
        
        saveButton.enabled = !text.isEmpty
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
        
            let name = nameTextField.text ?? ""
            
            // Set the workout to be passed to WorkoutTableViewController after the unwind segue
            workout = Workout(name: name)
        
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

