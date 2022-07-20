//
//  SeeAllViewController.swift
//  ChallengeTriunfo
//
//  Created by LoreVilaca on 19/07/22.
//

import UIKit

class SeeAllViewController: UIViewController {

    @IBOutlet var seeAllTableView: UITableView!
    
    var seeAllMovies: [Movie] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        seeAllTableView.dataSource = self
        seeAllTableView.delegate = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //passar o filme adiante para a proxima tela
        if let detailsViewController = segue.destination as? DetailsViewController{
            let movie = sender as? Movie
            detailsViewController.movie = movie
        }
    }

    
}
