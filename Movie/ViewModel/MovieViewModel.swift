//
//  MovieViewModel.swift
//  Movie
//
//  Created by Anıl on 24.09.2024.
//

import Foundation
import SwiftUI

class MovieListViewModel: ObservableObject {
    @Published var movies = [MovieViewModel]()
    let downloaderClient = DownloaderClient()
    
    func movieSearch(movieName: String) {
        downloaderClient.downloadMovies(search: movieName) { (result) in
            switch result {
            case .success(let movieArray):
                if let movieArray = movieArray {
                    DispatchQueue.main.async {
                        self.movies = movieArray.map(MovieViewModel.init)
                    }
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

struct MovieViewModel {
    let movie: Movie
    var title: String {
        movie.title
    }
    
    var poster: String {
        movie.poster
    }
    
    var year: String {
        movie.year
    }
    
    var imdbId: String {
        movie.imdbId
    }
}
