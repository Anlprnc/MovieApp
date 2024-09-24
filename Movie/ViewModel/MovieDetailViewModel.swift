//
//  MovieDetailViewModel.swift
//  Movie
//
//  Created by Anıl on 24.09.2024.
//

import Foundation
import SwiftUI

class MovieDetailViewModel: ObservableObject {
    @Published var movieDetail: MovieDetailsViewModel?
    let downloaderClient = DownloaderClient()
    
    func takeMovieDetail(imdbId: String) {
        downloaderClient.downloadMovieDetail(imdbId: imdbId) { (result) in
            switch result {
            case .success(let movieDetail):
                DispatchQueue.main.async {
                    self.movieDetail = MovieDetailsViewModel(detail: movieDetail)
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

struct MovieDetailsViewModel {
    let detail: MovieDetail
    
    var title: String {
        detail.title
    }
    
    var poster: String {
        detail.poster
    }
    
    var year: String {
        detail.year
    }
    
    var imdbId: String {
        detail.imdbId
    }
    
    var director: String {
        detail.director
    }
    
    var writer: String {
        detail.writer
    }
    
    var awards: String {
        detail.awards
    }
    
    var plot: String {
        detail.plot
    }
}
