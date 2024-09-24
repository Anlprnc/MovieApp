//
//  ContentView.swift
//  Movie
//
//  Created by Anıl on 24.09.2024.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var movieListViewModel: MovieListViewModel
    @State var movieToSearch = ""
    
    init() {
        self.movieListViewModel = MovieListViewModel()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Movie to Search", text: $movieToSearch, onEditingChanged: { _ in }, onCommit: {
                    self.movieListViewModel.movieSearch(movieName: movieToSearch)
                }).padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                List(movieListViewModel.movies, id: \.imdbId) { movie in
                    HStack {
                        SpecialImage(url: movie.poster)
                            .frame(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.17)
                        
                        VStack(alignment: .leading) {
                            Text(movie.title)
                                .font(.headline)
                            
                            Text(movie.year)
                                .font(.subheadline)
                        }
                        .padding()
                    }
                }.navigationTitle(Text("Movies"))
            }
        }
    }
}

#Preview {
    MovieListView()
}
