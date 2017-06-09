//
//  UserInfoView.swift
//  BrightOfficer
//
//  Created by Eliasz Sawicki on 09/06/2017.
//  Copyright © 2017 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit

class UserInfoView: UIView {
    
    @IBOutlet var view: UserInfoView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UINib(nibName: "UserInfo", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
    }
    
    func apply(user: User) {
        nameLabel.text = user.name
        phoneLabel.text = user.phoneNumber
        weightLabel.text = "\(user.weight)kg"
        infoLabel.text = user.info
        statusLabel.text = "Waiting"
    }
    
}
