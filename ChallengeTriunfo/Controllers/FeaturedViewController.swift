//
//  FeaturedViewController.swift
//  ChallengeTriunfo
//
//  Created by LoreVilaca on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController{
    
    var popularMovies: [Movie] = []
    var nowPlayingMovies: [Movie] = []
    var upcomingMovies: [Movie] = []
    
    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    @IBOutlet var upcomingCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        popularCollectionView.dataSource = self
        nowPlayingCollectionView.dataSource = self
        upcomingCollectionView.dataSource = self
        
        popularCollectionView.delegate = self
        nowPlayingCollectionView.delegate = self
        upcomingCollectionView.delegate = self
        
        Task {
            self.popularMovies = await Movie.popularMoviesAPI()
            self.popularCollectionView.reloadData()
        }
        
        Task {
            self.nowPlayingMovies = await Movie.nowPlayingMoviesAPI()
            self.nowPlayingCollectionView.reloadData()
        }
        
        Task {
            self.upcomingMovies = await Movie.upcomingMoviesAPI()
            self.upcomingCollectionView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //passar o filme adiante para a proxima tela
        
        if segue.identifier == "detailsSegue" {
            guard let detailsViewController = segue.destination as? DetailsViewController else {
                return
            }
            
            guard let movie = sender as? Movie else {
                return
            }
            detailsViewController.movie = movie
            
            
        } else if segue.identifier == "popularSeeAll" {
            guard let seeAllViewController = segue.destination as? SeeAllViewController else {
                return
            }
            seeAllViewController.seeAllMovies = popularMovies
            seeAllViewController.title = "Popular"
            
        } else if segue.identifier == "nowPlayingSeeAll" {
            guard let seeAllViewController = segue.destination as? SeeAllViewController else {
                return
            }
            seeAllViewController.seeAllMovies = nowPlayingMovies
            seeAllViewController.title = "Now Playing"
            
        } else {
            guard let seeAllViewController = segue.destination as? SeeAllViewController else {
                return
            }
            seeAllViewController.seeAllMovies = upcomingMovies
            seeAllViewController.title = "Upcoming"
        }
        
    }
}


