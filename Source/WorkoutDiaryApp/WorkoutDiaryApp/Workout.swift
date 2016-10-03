//
//  Workout.swift
//  WorkoutDiaryApp
//
//  Created by Alexander Lindgren on 31/08/16.
//  Copyright © 2016 Alexander Lindgren. All rights reserved.
//

//import Foundation
import UIKit

class Workout: NSObject, NSCoding {
    
    // MARK: Properties
    
    var name: String
    var exercises: [Exercise]?
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("workouts")
    
    // MARK: Types
    
    struct PropertyKey {
        static let nameKey = "name"
        static let exercisesKey = "exercises"
    }
    
    // MARK: Initialization
    
    init?(name: String, exercises: [Exercise]?) {
        // Initialize stored properties.
        self.name = name
        self.exercises = exercises
        
        super.init() // Call superclass initializer
        
        // Initialization should fail if there is no name or if the rating is out of range.
        if name.isEmpty {
            return nil
        }
    }
    
    // MARK: NSCoding
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.nameKey)
        aCoder.encode(exercises, forKey: PropertyKey.exercisesKey)

    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String
        let exercises = aDecoder.decodeObject(forKey: PropertyKey.exercisesKey) as? [Exercise]
        
        
        // Must call designated initializer.
        self.init(name: name, exercises: exercises)
    }
    
    
    func addExercise(name: String) {
     
        let newExercise = Exercise(name: name)
        
        if(self.exercises == nil) {
            exercises = [Exercise]()
            
            exercises?.append(newExercise)
            print("Added:", newExercise.name)
        } else {
            exercises?.append(newExercise)
        }
        
        
    }
    
}
