//
//  OnboardingViewController.swift
//  kudaGoSpb
//
//  Created by Виктория Козырева on 18.05.2021.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    var locations: Location = Location.init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "О событиях в каком городе вы бы хотели узнавать?"
        tableView.register(UINib(nibName: "OnboardingLocationTableViewCell", bundle: nil), forCellReuseIdentifier: "OnboardingLocationTableViewCell")
        continueButton.isEnabled = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NetworkManager.shared.getLocations(completion: { location in
            self.locations = location
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
   
}

extension OnboardingViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OnboardingLocationTableViewCell", for: indexPath) as! OnboardingLocationTableViewCell
        cell.configCell(location: self.locations[indexPath.row].name)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        continueButton.isEnabled = true
        //TODO: save town settings and present next onboardingScreen
    }
    
}
