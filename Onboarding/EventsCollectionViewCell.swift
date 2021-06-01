//
//  EventsCollectionViewCell.swift
//  kudaGoSpb
//
//  Created by Виктория Козырева on 29.05.2021.
//

import UIKit

class EventsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 3.0
        view.layer.borderColor = UIColor.black.cgColor
        view.clipsToBounds = true
    }
    
    func configCell(eventType: String) {
        self.label.text = eventType
    }
    
}
