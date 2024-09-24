//
//  DetailView.swift
//  Movie
//
//  Created by Anıl on 24.09.2024.
//

import SwiftUI

struct DetailView: View {
    let imdbId: String
    @ObservedObject var movieDetailViewModel = MovieDetailViewModel()
    
    var body: some View {
        VStack(spacing: 5) {
            SpecialImage(url: movieDetailViewModel.movieDetail?.poster ?? "placeholder")
                .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.4, alignment: .center)
            
            Text(movieDetailViewModel.movieDetail?.title ?? "Unknown")
                .font(.title)
                .bold()
                .padding()
            
            Divider()
            
            VStack(alignment: .leading) {
                Text(movieDetailViewModel.movieDetail?.plot ?? "Unknown")
                    .padding()
                
                Text("Director: \(movieDetailViewModel.movieDetail?.director ?? "Unknown")")
                    .padding()
                
                Text("Writers: \(movieDetailViewModel.movieDetail?.writer ?? "Unknown")")
                    .padding()
                
                Text("Awards: \(movieDetailViewModel.movieDetail?.awards ?? "Unknown")")
                    .padding()
                
                Text("Year: \(movieDetailViewModel.movieDetail?.year ?? "Unknown")")
                    .padding()
            }
        }.onAppear(perform: {
            self.movieDetailViewModel.takeMovieDetail(imdbId: imdbId)
        })
    }
}

#Preview {
    DetailView(imdbId: "test")
}
