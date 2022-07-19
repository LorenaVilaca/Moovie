//
//  TrendingViewController.swift
//  ChallengeTriunfo
//
//  Created by LoreVilaca on 19/07/22.
//

import UIKit

class TrendingViewController: UIViewController {

    @IBOutlet var trendingTableView: UITableView!
    @IBOutlet var trendingSegmentedControl: UISegmentedControl!
    
    var trendingMovies: [Movie] = []
    
    @IBAction func touchTrendingSegmentedControl(_ sender: Any) {
        if trendingSegmentedControl.selectedSegmentIndex == 0 {
            Task {
                self.trendingMovies = await Movie.trendingDayMoviesAPI()
                self.trendingTableView.reloadData()
            }
        } else {
            Task {
                self.trendingMovies = await Movie.trendingWeekMoviesAPI()
                self.trendingTableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        trendingTableView.delegate = self
        trendingTableView.dataSource = self
        // Do any additional setup after loading the view.
    
        Task {
            self.trendingMovies = await Movie.trendingDayMoviesAPI()
            self.trendingTableView.reloadData()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //passar o filme adiante para a proxima tela
        if let detailsViewController = segue.destination as? DetailsViewController{
            let movie = sender as? Movie
            detailsViewController.movie = movie
        }
    }
    
}
