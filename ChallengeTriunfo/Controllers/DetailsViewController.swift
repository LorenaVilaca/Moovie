//
//  DetailsViewController.swift
//  ChallengeTriunfo
//
//  Created by LoreVilaca on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var movie: Movie?
    
    @IBOutlet var backdropImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    @IBAction func touchImageButton(_ sender: Any) {
        self.performSegue(withIdentifier: "posterSegue", sender: movie)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let movie = movie else {
            return
        }
        self.title = movie.title
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.backdropPath)
            let image = UIImage(data: imageData) ?? UIImage ()
            backdropImage.image = image
        }
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
            let image = UIImage(data: imageData) ?? UIImage ()
            posterImage.image = image
        }
        
        titleLabel.text = movie.title
        let votingFormed: Float = round(movie.voteAverage*10)/10
        ratingLabel.text = "Rating: \(votingFormed)/10"
        overviewLabel.text = movie.overview
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //passar o filme adiante para a proxima tela
        if let destination = segue.destination as? PosterViewController{
            let movie = sender as? Movie
            destination.moviePoster = movie
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
