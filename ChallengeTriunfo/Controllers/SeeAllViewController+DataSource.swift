//
//  SeeAllViewController+DataSource.swift
//  ChallengeTriunfo
//
//  Created by LoreVilaca on 19/07/22.
//

import UIKit

extension SeeAllViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seeAllMovies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return makeSeeAllTable(indexPath)
    }
    
    
    fileprivate func makeSeeAllTable(_ indexPath: IndexPath) -> SeeAllTableViewCell {
        
        
        let tableCell = seeAllTableView.dequeueReusableCell(withIdentifier: SeeAllTableViewCell.cellIdentifier, for: indexPath) as! SeeAllTableViewCell
        
        let movie = seeAllMovies[indexPath.item]
        
        tableCell.setup(title: movie.title,
                        date: movie.releaseDate ?? "",
                        rating: String(movie.voteAverage),
                        image: UIImage())
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath ?? "")
            let posterImage = UIImage(data: imageData) ?? UIImage ()
            
            tableCell.setup(title: movie.title, date: String(movie.releaseDate!.prefix(4) ?? ""), rating: String(movie.voteAverage), image: posterImage)
        }
        return tableCell
    }
    
}
