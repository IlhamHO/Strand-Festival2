//
//  ArtistTableViewCell.swift
//  Strand Festival
//
//  Created by AMINE on 2/4/19.
//  Copyright © 2019 be.ehb. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageLabel: UIImageView!
    

    @IBOutlet weak var lblArtistName: UILabel!
    
    @IBOutlet weak var lblArtistDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
