//
//  FeaturedViewController.swift
//  ChallengeTriunfo
//
//  Created by LoreVilaca on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    @IBOutlet var upcomingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        popularCollectionView.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? PopularCollectionViewCell {
            cell.titleLabel.text = "Título do filme"
            cell.image.image = UIImage ()
            return cell
        }
        
        return UICollectionViewCell ()
    }
    

}

