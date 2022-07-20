//
//  SearchViewController+Delegate.swift
//  ChallengeTriunfo
//
//  Created by LoreVilaca on 19/07/22.
//

import Foundation
import UIKit

extension SearchViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movie: Movie
        
        if tableView == searchTableView {
            
            movie = searchMovies[indexPath.item]
            
            self.performSegue(withIdentifier: "searchToDetailSegue", sender: movie)
        }
    }
}
