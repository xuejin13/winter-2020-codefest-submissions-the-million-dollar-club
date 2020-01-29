//
//  PersonalCellTableViewCell.swift
//  Passion
//
//  Created by Xuejin Gao on 1/28/20.
//  Copyright © 2020 Xuejin Gao. All rights reserved.
//

import UIKit

class PersonalCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
