//
//  WorkoutTableViewController.swift
//  WorkoutDiaryApp
//
//  Created by Alexander Lindgren on 31/08/16.
//  Copyright © 2016 Alexander Lindgren. All rights reserved.
//

import UIKit

class WorkoutTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var workouts = [Workout]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem

        // Load any saved meals, otherwise load sample data.
        if let savedWorkouts = loadWorkouts() {
            workouts += savedWorkouts
        } else {
            // Load the sample data.
            loadSampleWorkouts()
        }
        
    }
    
    func loadSampleWorkouts(){
        
        let workout1 = Workout(name: "Legs", exercises: nil)
        let workout2 = Workout(name: "Chest", exercises: nil)
        let workout3 = Workout(name: "Abs", exercises: nil)
        
        workout1!.addExercise(name: "ABS")
        
        
        workouts.append(workout1!)
        workouts.append(workout2!)
        workouts.append(workout3!)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "DiaryTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! DiaryTableViewCell
        
        let workout = workouts[(indexPath as NSIndexPath).row]
        
        cell.nameLabel.text = workout.name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            // Delete the row from the data source
            
            workouts.remove(at: indexPath.row)
            saveWorkouts()
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            
            // Create new instance of workout, insert it into the array, add a new row to the table view
            
            
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            
            let workoutDetailViewController = segue.destination as! ExerciseTableViewController
            
            if let selectedWorkoutCell = sender as? DiaryTableViewCell {
                let indexPath = tableView.indexPath(for: selectedWorkoutCell)!
                let selectedWorkout = workouts[(indexPath as NSIndexPath).row]
                workoutDetailViewController.workout = selectedWorkout
            }
        }
        else if segue.identifier == "AddItem"{
            
            print("Adding new workout")
            
        }
    }
    
    @IBAction func unwindToWorkoutList(_ sender: UIStoryboardSegue) {
    
        if let sourceViewController = sender.source as? WorkoutViewController, let workout = sourceViewController.workout {
            
            if let selecedIndexPath = tableView.indexPathForSelectedRow {
                
                // Update an existing workout
                workouts[(selecedIndexPath as NSIndexPath).row] = workout
                tableView.reloadRows(at: [selecedIndexPath], with: .none)
            }
            else {
        
                //Add a new workout
                let newIndexPath = IndexPath(item: workouts.count, section: 0)
                workouts.append(workout)
                tableView.insertRows(at: [newIndexPath], with: .bottom)
            }
            
            // Save the workouts.
            saveWorkouts()
        }
    }
    
    func saveWorkouts() {
        
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(workouts, toFile: Workout.ArchiveURL.path)
        
        if !isSuccessfulSave {
            
            print("Failed to save workouts...")
        }
        
    }
    
    func loadWorkouts() -> [Workout]? {
        
        return NSKeyedUnarchiver.unarchiveObject(withFile: Workout.ArchiveURL.path) as? [Workout]
    }
    
    
}
