//
//  launchScreen.swift
//  personal_project
//
//  Created by Jordan Evans on 11/9/22.
//

//import Foundation
import SwiftUI
struct fullMovieView: View {
    @State var searchInput: String = ""
    //change movie to an array of movies
    @State var movie = Movie.movie
    @State var movies = [Movie]()
    var body: some View {
        //not sure whether to put this here or in contentView
        
        API.fetchFullMovie(term: "\(movie.imdbID)"){ result in
            switch result {
                case .success(let movie):
                    // print("hi")
                    // print("got Title:", movies)
                    self.movie = movie
                    // print("got Year:", Year)
                case .failure(let error):
                    print("Fetching Title failed.", error)
            }
        }
        
        fullMovieView(movie: movie)
        
    }
    func fullMovieView(movie: Movie) -> some View {
                HStack{
                    //image from json
                    AsyncImage(url: URL(string: movie.Poster)) { image in
                        image
                            .resizable().aspectRatio(contentMode: .fit).cornerRadius(10)
                            .scaledToFit().padding(10)
                        //    .frame(width: 150, height: 150, alignment: .bottomLeading)
                    } placeholder: {
                        Color.white
                        Text(movie.Title).font(.system(size: 14.0))
                    } .frame(width: 125, height: 150, alignment: .bottomLeading)
                    //categories from json
                    let genreList = movie.Genre?.split(separator: ",") ?? ["Adventure", "Comedy"]
                        HStack {
                            ForEach(genreList, id: \.self) { genre in
                                Text(genre).font(.system(size: 14.0)).foregroundColor(.white).padding(4)
                                    .background(Color.pink)
                                    .cornerRadius(10)
                                    .padding([.trailing], 15)
                            //                           Capsule().stroke(.white).overlay(.padding(.vertical).padding(.horizontal))
                            }
                        }
                    
                    } //.foregroundColor(Color("lightGrey"))

        }
   // }
}
