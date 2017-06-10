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
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextStepButton: UIButton!
    
    private var userActionPerformer = UserActionPerformer()
    var user: User?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UINib(nibName: "UserInfo", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
    }
    
    func statusName(status: String) -> String{
        //        ['init', 'traveling', 'waiting', 'finished'],
        switch (status) {
        case "init":
            return "Zgłoszenie"
        case "traveling":
            return "W podróży"
        case "waiting":
            return "Czeka na pomoc"
        case "withofficer":
            return "Jest z opiekunem"
        case "finished":
            return "Podróż zakończona"
        default:
            return ""
        }
    }
    
    func buttonName(status: String) -> String {
        switch (status) {
        case "init":
            return ""
        case "traveling":
            return ""
        case "waiting":
            return "Odbierz osobę"
        case "withofficer":
            return "Odprowadziłem osobę"
        case "finished":
            return ""
        default:
            return ""
        }
    }
    
    func apply(user: User) {
        self.user = user
        nameLabel.text = user.name
        phoneLabel.text = user.phoneNumber
        weightLabel.text = "\(user.weight)kg"
        infoLabel.text = user.info
        statusLabel.text = statusName(status: user.status)
        nextStepButton.setTitle(buttonName(status: user.status), for: .normal)
        let url = URL(string: user.picture)!
        if let data = try? Data(contentsOf: url) {
            imageView.image = UIImage(data: data)
        }
        
    }
    @IBAction func didTapActionButton(_ sender: Any) {
        if let user = user {
            userActionPerformer.changeStatusFor(user: user)
            
            ApiClient.sharedInstance.nextStep(id: user.callId)
        }
    }
    
}
