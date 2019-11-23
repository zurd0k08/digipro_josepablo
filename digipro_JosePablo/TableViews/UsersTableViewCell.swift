//
//  UsersTableViewCell.swift
//  digipro_JosePablo
//
//  Created by Jose Pablo Perez Estrada on 11/23/19.
//  Copyright © 2019 Jose Pablo Perez Estrada. All rights reserved.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userMail: UILabel!
    @IBOutlet weak var userPhone: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
