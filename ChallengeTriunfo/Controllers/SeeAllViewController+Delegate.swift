//
//  SeeAllViewController+Delegate.swift
//  ChallengeTriunfo
//
//  Created by LoreVilaca on 19/07/22.
//

import UIKit

extension SeeAllViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movie: Movie
        
        if tableView == seeAllTableView{
            movie = seeAllMovies[indexPath.item]
            
        } else {
            return
        }
        self.performSegue(withIdentifier: "detailsTableSegue", sender: movie)
    }
}
