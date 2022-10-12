//  Movie info.swift
//  personal_project
//
//  Created by Jordan Evans on 9/28/22.
//
//control i auto formatting


import Foundation

struct Movie: Codable {
    var Title: String
    static var movies: Movie? {
           Movie.fromJSON(titled: "movies")
       }

static func fromJSON(titled Title: String) -> Movie? {
        if let data = Data.fromJSONFile(forTitle: Title) {
            print("we got data")
    
//
//    if let url = URL(string: "http://www.omdbapi.com/?i=tt3896198&apikey=f8344039") {
      let decoder = JSONDecoder()
//print("Url is valid")
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//
//          if let data = data {
//              do {
//                  print("Response \(response)")
//                  print("data \(data)")
//
//                 let movies = try decoder.decode(Movie.self, from: data)
//                 print(movies.Title)
//              } catch let error {
//                 print(error)
//                }
//          }
//       }


            do{
                let movies = try decoder.decode(Movie.self, from: data)
                print("heres the movie title: ", movies.Title)
                return movies
            } catch {
                print("could not read", error.localizedDescription)
                return nil
            }
        }
        return nil
    }
    //return nil
}

    

//        URLSession.shared.dataTask(with: url) { data, response, error in
//          if let data = data {
//              do {
//                 let movies = try decoder.decode(Movie.self, from: data)
//                 print(movies.Title)
//              } catch let error {
//                 print(error)
//                }
//          }
//       }
  //  }
    

    

    
    
    
    
    
    
////    static var movies: Movie? {
////        Movie.fromJSON(titled: "Guardians of the Galaxy Vol. 2")
////    }
//}
