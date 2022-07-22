//
//  PosterViewController.swift
//  ChallengeTriunfo
//
//  Created by LoreVilaca on 18/07/22.
//

import UIKit

class PosterViewController: UIViewController {
    
    var moviePoster: Movie?
    
    @IBOutlet var posterImage: UIImageView!
    
    override func viewDidLoad() {
        guard let movie = moviePoster else {
            return
        }
        self.title = movie.title
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath ?? "")
            let image = UIImage(data: imageData) ?? UIImage ()
            posterImage.image = image
        }
    }
    
   
}
