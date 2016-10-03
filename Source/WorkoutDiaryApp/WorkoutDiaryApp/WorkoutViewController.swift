//
//  WorkoutViewController.swift
//  WorkoutDiaryApp
//
//  Created by Alexander Lindgren on 31/08/16.
//  Copyright © 2016 Alexander Lindgren. All rights reserved.
//

import UIKit

class WorkoutViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var nameTextField: UITextField!
    
    var workout: Workout?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input via delegate callbacks
        nameTextField.delegate = self
        
        //Set up views if editing an existing Workout
        if let workout = workout {
            navigationItem.title = workout.name
            nameTextField.text = workout.name
        }
        
        // Enable the Save button only if the text field has a valid workout name.
        checkValidWorkoutName()
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        dismiss(animated: true, completion: nil) //STRANGE!
        
        
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController!.popViewController(animated: true)
        }
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    
        //Disable the Save button while editing.
        
        saveButton.isEnabled = false
    
    }
    
    func checkValidWorkoutName() {
        
        //Disable the Save button if the text field is empty.
        
        let text = nameTextField.text ?? ""
        
        saveButton.isEnabled = !text.isEmpty
    
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    
        checkValidWorkoutName()
        navigationItem.title = textField.text
    
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if saveButton === sender as! UIBarButtonItem! {
        
            let name = nameTextField.text ?? ""
            
            // Set the workout to be passed to WorkoutTableViewController after the unwind segue
            workout = Workout(name: name, exercises: nil)
        
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

