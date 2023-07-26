//
//  ContactsTableViewCell.swift
//  ContactsApp
//
//  Created by Ecem Akçay on 24.07.2023.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var contactsNameLabel: UILabel!
    @IBOutlet weak var contactsImageView: UIImageView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
