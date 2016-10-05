//
//  ExerciseStartTableViewCell.swift
//  WorkoutDiaryApp
//
//  Created by Alexander Lindgren on 03/10/16.
//  Copyright © 2016 Alexander Lindgren. All rights reserved.
//

import UIKit

class ExerciseCustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
