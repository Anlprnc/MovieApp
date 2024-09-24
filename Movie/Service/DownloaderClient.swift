//
//  DownloaderClient.swift
//  Movie
//
//  Created by Anıl on 24.09.2024.
//

import Foundation

class DownloaderClient {
    func downloadMovies(search: String, completion: @escaping (Result<[Movie]?, DownloaderError>) -> Void) {
        guard let url = URL(string: "http://www.omdbapi.com/?s=\(search)&apikey=a9548b19") else {
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.noDataReceived))
            }
            
            guard let movieResponse = try? JSONDecoder().decode(IncomingMovie.self, from: data) else {
                return completion(.failure(.dataCanNotBeDecoded))
            }
            
            completion(.success(movieResponse.movies))
        }.resume()
    }
    
    func downloadMovieDetail(imdbId: String, completion: @escaping (Result<MovieDetail, DownloaderError>) -> Void) {
        guard let url = URL(string: "http://www.omdbapi.com/?i=\(imdbId)&apikey=a9548b19") else {
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.noDataReceived))
            }
            
            guard let movieDetailResponse = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                return completion(.failure(.dataCanNotBeDecoded))
            }
            
            completion(.success(movieDetailResponse.self))
        }.resume()
    }
}

enum DownloaderError: Error {
    case wrongUrl
    case noDataReceived
    case dataCanNotBeDecoded
}
