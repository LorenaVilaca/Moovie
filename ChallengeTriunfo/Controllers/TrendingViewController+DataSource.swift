//
//  TrendingViewController+DataSource.swift
//  ChallengeTriunfo
//
//  Created by LoreVilaca on 19/07/22.
//

import UIKit

extension TrendingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendingMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return makeTrendingTable(indexPath)
    }
    
    
    fileprivate func makeTrendingTable(_ indexPath: IndexPath) -> TrendingTableViewCell {
        
        
        let tableCell = trendingTableView.dequeueReusableCell(withIdentifier: TrendingTableViewCell.cellIdentifier, for: indexPath) as! TrendingTableViewCell
        
        tableCell.setup(title: trendingMovies[indexPath.item].title,
                        date: trendingMovies[indexPath.item].releaseDate,
                        posterImage: UIImage())
        
        let movie = trendingMovies[indexPath.item]
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
            let posterImage = UIImage(data: imageData) ?? UIImage ()
            
            tableCell.setup(title: movie.title, date: movie.releaseDate, posterImage: posterImage)
        }
        return tableCell
    }
}
