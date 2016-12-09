//
//  MusicTableViewCell.swift
//  iMusic
//
//  Created by Akiro on 29/11/2016.
//  Copyright © 2016 Esgi. All rights reserved.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
