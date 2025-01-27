//
//  SettingsCell.swift
//  FitnessApp
//
//  Created by emmanuel.jimenez on 27/01/25.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    @IBOutlet var labelView: UIView!
    @IBOutlet var label: UILabel!
    @IBOutlet var accessoryIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
