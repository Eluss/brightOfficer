//
//  ViewController.swift
//  BrightOfficer
//
//  Created by Eliasz Sawicki on 09/06/2017.
//  Copyright © 2017 Eliasz Sawicki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var users: [User] = [User]()
    var usersFetcher = UsersFetcher()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userInfoView: UserInfoView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bright Officer"
        usersFetcher.fetchUsers { users in
            self.users = users
            self.tableView.reloadData()
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.phoneNumber
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        userInfoView.apply(user: user)
    }


    
    
}

