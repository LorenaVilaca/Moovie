//
//  TrendingViewController+Delegate.swift
//  ChallengeTriunfo
//
//  Created by LoreVilaca on 19/07/22.
//

import UIKit

extension TrendingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movie: Movie
        
        movie = trendingMovies[indexPath.item]
      
        self.performSegue(withIdentifier: "trendingToDetailsSegue", sender: movie)
    }
}
