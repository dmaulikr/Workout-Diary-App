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

        loadSampleWorkouts()
        
    }
    
    func loadSampleWorkouts(){
        
        let workout1 = Workout(name: "Legs")
        let workout2 = Workout(name: "Chest")
        let workout3 = Workout(name: "Abs")
        
        workouts += [workout1, workout2, workout3]
        
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            
            let workoutDetailViewController = segue.destination as! WorkoutViewController
            
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
        }
    }
}
