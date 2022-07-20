//
//  SearchTableViewCell.swift
//  ChallengeTriunfo
//
//  Created by LoreVilaca on 19/07/22.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    static let cellIdentifier = "searchTableCell"
    
    func setup (title: String, date: String, posterImage: UIImage) {
        self.titleLabel.text = title
        self.dateLabel.text = String(date.prefix(4))
        self.posterImage.image = posterImage
    }
}
