//
//  EventTypeViewController.swift
//  kudaGoSpb
//
//  Created by Виктория Козырева on 26.05.2021.
//

import UIKit

class EventTypeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    var eventTypes = [OnboardingApiResponse].init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = "Какие события наиболее интересны для вас?"
        collectionView.register(UINib(nibName: "EventsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "EventsCollectionViewCell")
        continueButton.isEnabled = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.allowsMultipleSelection = true
        self.collectionView.allowsMultipleSelectionDuringEditing = true
       
        NetworkManager.shared.getEventTypes(completion: { eventTypes in
            self.eventTypes = eventTypes
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
    }
    


}

extension EventTypeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventsCollectionViewCell", for: indexPath) as! EventsCollectionViewCell
        cell.configCell(eventType: self.eventTypes[indexPath.row].name)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO: save data
        self.collectionView.cellForItem(at: indexPath)?.backgroundColor = .green
    }
    
}


extension EventTypeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: UIScreen.main.bounds.width, height: 80)
    }
}
