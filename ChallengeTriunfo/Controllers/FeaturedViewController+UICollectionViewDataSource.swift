//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  ChallengeTriunfo
//
//  Created by LoreVilaca on 12/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == popularCollectionView {
            return popularMovies.count
        } else if collectionView == nowPlayingCollectionView {
            return nowPlayingMovies.count
        } else if collectionView == upcomingCollectionView{
            return upcomingMovies.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == popularCollectionView {
            return makePopularCell(indexPath)
        } else if collectionView == nowPlayingCollectionView {
            return makeNowPlayingCell(indexPath)
        } else if collectionView == upcomingCollectionView {
            return makeUpcomingCell(indexPath)
        }
        return UICollectionViewCell ()
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        if let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as?
            PopularCollectionViewCell {
            cell.setup(title: popularMovies[indexPath.item].title,
                       image: UIImage())
            
            let movie = popularMovies[indexPath.item]
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.backdropPath ?? "")
                let image = UIImage(data: imageData) ?? UIImage ()
                cell.setup(title: movie.title, image: image)
            }
            return cell
        }
        return PopularCollectionViewCell ()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        if let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell {
            cell.setup(title: nowPlayingMovies[indexPath.item].title,
                       year: String(nowPlayingMovies[indexPath.item].releaseDate!.prefix (4)),
                       image: UIImage ())
            
            let movie = nowPlayingMovies[indexPath.item]
            
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath ?? "")
                let image = UIImage (data: imageData) ?? UIImage ()
                cell.setup(title: movie.title, year: String(movie.releaseDate!.prefix(4)) , image: image)
            }
            
            return cell
        }
        return NowPlayingCollectionViewCell ()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        if let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell {
            cell.setup(title: upcomingMovies[indexPath.item].title,
                       date: String(upcomingMovies[indexPath.item].releaseDate ?? ""),
                       image: UIImage ())
            
            let movie = upcomingMovies[indexPath.item]
            
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath ?? "")
                let image = UIImage (data: imageData) ?? UIImage ()
                cell.setup(title: movie.title, date: movie.releaseDate ?? "", image: image)
            }
            
            return cell
        }
        return UpcomingCollectionViewCell ()
    }
}
