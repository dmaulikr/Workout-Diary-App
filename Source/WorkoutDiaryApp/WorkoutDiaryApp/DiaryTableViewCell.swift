//
//  DiaryTableViewCell.swift
//  WorkoutDiaryApp
//
//  Created by Alexander Lindgren on 31/08/16.
//  Copyright © 2016 Alexander Lindgren. All rights reserved.
//

import UIKit

class DiaryTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
