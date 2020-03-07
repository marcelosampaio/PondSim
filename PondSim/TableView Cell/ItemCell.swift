//
//  ItemCell.swift
//  PondSim
//
//  Created by Marcelo Sampaio on 07/03/20.
//  Copyright © 2020 Marcelo Sampaio. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var prova: UILabel!
    @IBOutlet weak var peso: UILabel!
    @IBOutlet weak var nota: UILabel!
    
    
    // MARK: - Others
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
