//
//  SearchViewController+DataSource.swift
//  ChallengeTriunfo
//
//  Created by LoreVilaca on 19/07/22.
//

import Foundation
import UIKit

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchCell = searchTableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.cellIdentifier, for: indexPath) as! SearchTableViewCell
        
        let movie = searchMovies[indexPath.item]
        
        searchCell.setup(title: movie.title, date: movie.releaseDate, posterImage: UIImage())
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath ?? "")
            let image = UIImage(data: imageData) ?? UIImage()
            searchCell.setup(title: movie.title, date: movie.releaseDate, posterImage: image)
            
        }
        return searchCell
    }
}
