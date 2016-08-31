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

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "DiaryTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! DiaryTableViewCell
        
        let workout = workouts[indexPath.row]
        
        cell.nameLabel.text = workout.name

        return cell
    }
    
    @IBAction func unwindToWorkoutList(sender: UIStoryboardSegue) {
    
        if let sourceViewController = sender.sourceViewController as? WorkoutViewController, workout = sourceViewController.workout {
        
            //Add a new workout
            let newIndexPath = NSIndexPath(forItem: workouts.count, inSection: 0)
            
            workouts.append(workout)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
        
        }
    }
}
