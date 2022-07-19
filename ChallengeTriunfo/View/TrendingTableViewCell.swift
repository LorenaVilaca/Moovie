//
//  TrendingTableViewCell.swift
//  ChallengeTriunfo
//
//  Created by LoreVilaca on 19/07/22.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {

    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    static let cellIdentifier = "trendingTable"
    
    func setup (title: String, date: String, posterImage: UIImage){
        self.posterImage.image = posterImage
        self.titleLabel.text = title
        self.dateLabel.text = String(date.prefix(4))
    }

}
