//
//  OnboardingViewController.swift
//  kudaGoSpb
//
//  Created by Виктория Козырева on 18.05.2021.
//

import UIKit



class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    var data = [OnboardingApiResponse].init()
    var currentType: OnboardingType = OnboardingPresentor.shared.currentOnboardScreen
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch self.currentType {
        
        case .location:
            titleLabel.text = "О событиях в каком городе вы бы хотели узнавать?"
            NetworkManager.shared.getLocations(completion: { data in
                self.data = data
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
            
        case .event:
            titleLabel.text = "Какие события наиболее интересны для вас?"
            self.tableView.allowsMultipleSelection = true
            self.tableView.allowsMultipleSelectionDuringEditing = true
            NetworkManager.shared.getEventTypes(completion: { data in
                self.data = data
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
            addReadyButton()
        }
        
        tableView.register(UINib(nibName: "OnboardingLocationTableViewCell", bundle: nil), forCellReuseIdentifier: "OnboardingLocationTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
  
    }
    
    func addReadyButton() {
        //TODO: normal button position and constraints
          let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
          button.backgroundColor = .green
          button.setTitle("Ready!", for: .normal)
          button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
          self.view.addSubview(button)

        
    }
    @objc func buttonAction(sender: UIButton!) {
        //TODO: saved data events
        dismiss(animated: false, completion: nil)
    }

   
}

extension OnboardingViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OnboardingLocationTableViewCell", for: indexPath) as! OnboardingLocationTableViewCell
        cell.configCell(location: self.data[indexPath.row].name)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        OnboardingPresentor.shared.currentOnboardScreen = .event
        let captureViewCon = OnboardingViewController(nibName: "OnboardingViewController", bundle: nil)
        self.navigationController?.pushViewController(captureViewCon, animated: true)
    }
    
}
