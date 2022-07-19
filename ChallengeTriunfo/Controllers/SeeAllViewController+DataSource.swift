//
//  SeeAllViewController+DataSource.swift
//  ChallengeTriunfo
//
//  Created by LoreVilaca on 19/07/22.
//

import UIKit

extension SeeAllViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == seeAllTableView {
            return seeAllMovies.count
        } else {
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return makePopularTable(indexPath)
    }
    
    
    fileprivate func makePopularTable(_ indexPath: IndexPath) -> SeeAllTableViewCell {
        
        
        let tableCell = seeAllTableView.dequeueReusableCell(withIdentifier: SeeAllTableViewCell.cellIdentifier, for: indexPath) as! SeeAllTableViewCell
        
        tableCell.setup(title: seeAllMovies[indexPath.item].title,
                        date: seeAllMovies[indexPath.item].releaseDate,
                        rating: String(seeAllMovies[indexPath.item].voteAverage),
                        image: UIImage())
        
        let movie = seeAllMovies[indexPath.item]
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
            let posterImage = UIImage(data: imageData) ?? UIImage ()
            
            tableCell.setup(title: movie.title, date: movie.releaseDate, rating: String(movie.voteAverage), image: posterImage)
        }
        return tableCell
    }
    
}
