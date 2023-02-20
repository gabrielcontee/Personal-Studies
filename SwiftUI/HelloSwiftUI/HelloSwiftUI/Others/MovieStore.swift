////
////  MovieStore.swift
////  HelloSwiftUI
////
////  Created by Gabriel Conte on 13/10/2022.
////
//
//import Foundation
//
//struct MovieResponse: Decodable {
//
//    let movies: [Movie]
//
//    private enum CodingKeys: String, CodingKey {
//
//        case movies = "search"
//    }
//}
//
//struct Movie {
//
//    let imdbId: String
//    let title: String
//    let poster: String
//
//    private enum CodingKeys: String, CodingKey {
//
//        case imdbId = "imdbID"
//        case title = "Title"
//        case poster = "Poster"
//    }
//}
//
//class MovieStore: ObservableObject {
//
//    @Published var movies: [Movie]? = [Movie]()
//
//    func getAll() {
//
//        guard let url = URL(string: "https://api.themoviedb.org/3/movie/550?api_key=286f3a22bf23276d5f0f876abb8f8f06") else {
//
//            fatalError()
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//
//            guard let data = data, error == nil else {
//
//                return
//            }
//
//            let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
//
//            if let movieResponse = movieResponse {
//
//                self.movies = movieResponse.movies
//            }
//        }.resume()
//    }
//}
