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
    
    let monthNumToName = ["01-": "Jan ",
                              "02-": "Feb ",
                              "03-": "Mar ",
                              "04-": "Apr ",
                              "05-": "May ",
                              "06-": "Jun ",
                              "07-": "Jul ",
                              "08-": "Aug ",
                              "09-": "Sep ",
                              "10-": "Oct ",
                              "11-": "Nov ",
                              "12-": "Dec "]
    
    func setup (title: String, date: String, image: UIImage){
        self.titleLabel.text = title
        self.dateLabel.text = convertDate(date: String(date.suffix((5))))
        self.imageView.image = image
    }
    
    func convertDate (date: String) -> String {
        return (monthNumToName[String(date.prefix(3))] ?? "") + String (date.suffix(2))
    }
    
    
}
