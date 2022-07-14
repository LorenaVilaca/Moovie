//
//  UpcomingCollectionViewCell.swift
//  ChallengeTriunfo
//
//  Created by LoreVilaca on 11/07/22.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "upcomingCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setup (title: String, date: String, image: UIImage){
        self.titleLabel.text = title
        self.dateLabel.text = date
        self.imageView.image = image
    }
    
}
