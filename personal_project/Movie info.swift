//
//  Movie info.swift
//  personal_project
//
//  Created by Jordan Evans on 9/28/22.
//
//control i auto formatting

import Foundation

struct Movie: Codable, Identifiable {
    var Title: String
    var Genre: String?
    var Poster: String
    var Year: String
    //var imdbRating: String
    var imdbID: String
    
    var id: String {
        imdbID
    }
    
    static var movie: Movie {
        Movie.fromJSON(titled: "movies")!
    }
    
    
    static func fromJSON(titled Genre: String) -> Movie? {
        if let data = Data.fromJSONFile(forTitle: Genre) {
            print("we got data")
            
            //    if let url = URL(string: "http://www.omdbapi.com/?i=tt3896198&apikey=f8344039") {
            //        let decoder = JSONDecoder()
            //
            let decoder = JSONDecoder()
            
            do{
                let movies = try decoder.decode(Movie.self, from: data)
                print("heres the movie title: ", movies)
                return movies
            } catch {
                print("could not read", error.localizedDescription)
            }
        }
        return nil
    }
}

    
