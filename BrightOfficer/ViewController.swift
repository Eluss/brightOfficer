//
//  ViewController.swift
//  BrightOfficer
//
//  Created by Eliasz Sawicki on 09/06/2017.
//  Copyright © 2017 Eliasz Sawicki. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var users: [User] = [User]()
    var usersFetcher = UsersFetcher()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userInfoView: UserInfoView!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            refresh()
    }
    
    func refresh() {
        self.usersFetcher.fetchUsers { users in
            self.users = users
            self.tableView.reloadData()
            let indexPath = IndexPath(row: 0, section: 0)
            self.userInfoView.apply(user: users.first!)
            self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
            self.clearAnnotations()
            self.addAnnotationToMapKit(name: users.first!.name, coords: users.first!.location!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bright Officer"
        
        NotificationCenter.default.addObserver(self, selector: #selector(refresh), name: NSNotification.Name(rawValue: "refresh"), object: nil)        
        
        userInfoView.refreshed = { _ in
            self.refresh()
        }
        
        refresh()
    }
    
    @IBAction func refreshData(_ sender: Any) {
        refresh()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.phoneNumber
        cell.selectionStyle = .gray
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        userInfoView.apply(user: user)
        
        clearAnnotations()
        addAnnotationToMapKit(name: user.name, coords: user.location!)
    }
    
    func clearAnnotations() {
        mapView.removeAnnotations(mapView.annotations)
    }
    
    func addAnnotationToMapKit(name: String, coords: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coords
        annotation.title = name
        mapView.addAnnotation(annotation)
        let region = MKCoordinateRegionMakeWithDistance(coords, 20000, 20000)
        mapView.setRegion(region, animated: true)
    }
    
}

