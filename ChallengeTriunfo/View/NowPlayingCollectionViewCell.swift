//
//  NowPlayingCollectionViewCell.swift
//  ChallengeTriunfo
//
//  Created by LoreVilaca on 11/07/22.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "nowPlayingCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setup (title: String, year: String, image: UIImage) {
        self.titleLabel.text = title
        self.dateLabel.text = year
        self.imageView.image = image
    }
}
