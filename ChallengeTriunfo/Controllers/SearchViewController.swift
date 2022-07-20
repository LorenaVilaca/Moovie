//
//  SearchViewController.swift
//  ChallengeTriunfo
//
//  Created by LoreVilaca on 19/07/22.
//

import UIKit

class SearchViewController: UIViewController, UISearchResultsUpdating {
    
    
    @IBOutlet var searchTableView: UITableView!
    var searchMovies: [Movie] = []
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        // Do any additional setup after loading the view.
        
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let title = searchController.searchBar.text else {return}
        
        Task {
            self.searchMovies = await Movie.searchMoviesAPI(title: title)
            searchTableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "searchToDetailSegue" {
            guard let detailsViewController = segue.destination as? DetailsViewController else { return }
            guard let movie = sender as? Movie else { return }
            detailsViewController.movie = movie
        } else {
            return }
        
    }
    

}
