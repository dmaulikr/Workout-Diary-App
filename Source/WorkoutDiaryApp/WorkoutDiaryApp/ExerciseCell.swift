//
//  ExerciseCell.swift
//  WorkoutDiaryApp
//
//  Created by Alexander Lindgren on 05/10/16.
//  Copyright © 2016 Alexander Lindgren. All rights reserved.
//

import UIKit

class ExerciseCell: UITableViewCell {
    
    

    @IBOutlet weak var repsTextField: UITextField!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
