//
//  OnboardingLocationTableViewCell.swift
//  kudaGoSpb
//
//  Created by Виктория Козырева on 18.05.2021.
//

import UIKit

class OnboardingLocationTableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 3.0
        view.layer.borderColor = UIColor.black.cgColor
        view.clipsToBounds = true
    }
    
    func configCell(location: String) {
        self.locationLabel.text = location
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        UserDefaults.standard.set(locationLabel.text, forKey: "userlocation")
    }
    
    
}
