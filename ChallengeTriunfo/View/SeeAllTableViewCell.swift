//
//  SeeAllTableViewCell.swift
//  ChallengeTriunfo
//
//  Created by LoreVilaca on 19/07/22.
//

import UIKit

class SeeAllTableViewCell: UITableViewCell {


    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    
    static let cellIdentifier = "seeAllTable"
    
    func setup (title: String, date: String, rating: String, image: UIImage) {
        self.titleLabel.text = title
        self.dateLabel.text = String(date.prefix(4))
        self.ratingLabel.text = rating
        self.posterImage.image = image
    }
}
