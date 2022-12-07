//
//  launchScreen.swift
//  personal_project
//
//  Created by Jordan Evans on 11/9/22.
//

//import Foundation
import SwiftUI
struct fullMovieView: View {
    //change movie to an array of movies
    @State var movie: Movie
    
    
    var body: some View {
        //not sure whether to put this here or in contentView
    
        
        fullMovieView(movie: movie)
            .onAppear(){
                API.fetchFullMovie(term: "\(movie.imdbID)"){ result in
                    switch result {
                        case .success(let movie):
                            print("hi")
                            // print("got Title:", movies)
                            self.movie = movie
                            // print("got Year:", Year)
                        case .failure(let error):
                            print("Fetching Title failed.", error)
                    }
                }
            }
        
    }
    
    func fullMovieView(movie: Movie) -> some View {
        ZStack{
            Color("darkGrey")
            VStack{
                    //image from json
                Text(movie.Title).font(.system(size: 20.0)).padding([.top], 90).bold()
                    .foregroundColor(.white).multilineTextAlignment(.center)
                    .padding([.leading], 30).padding([.trailing], 30).padding([.bottom], 5)
                    
                    AsyncImage(url: URL(string: movie.Poster)) { image in
                        image
                            .resizable().aspectRatio(contentMode: .fit).cornerRadius(10)
                            .scaledToFit().padding(10)
                        
                    } placeholder: {
                        Color.white
                        Text(movie.Title).font(.system(size: 14.0)).bold()
                    } .frame(width: 300, height: 250)
                    //categories from json
                    
                    
                    HStack{
                        if let rated = movie.Rated{
                            Text(rated).font(.system(size: 16.0)).padding([.trailing], 20).padding([.bottom], 15).foregroundColor(.white).bold()
                        }
                        if let year = movie.Year{
                            Text(year).font(.system(size: 16.0)).padding([.trailing], 20).padding([.bottom], 15).foregroundColor(.white).bold()
                        }
                        if let runTime = movie.Runtime{
                            Text(runTime).font(.system(size: 16.0)).padding([.bottom], 15).foregroundColor(.white).bold()
                        }
                    }
                    
                    
                    if let starRatings = movie.starRating{
                        StarRatingView(rating: starRatings).padding([.bottom], 15).foregroundColor(Color("darkCoral"))
                    }
                    
                    //trim and map
                    let genreList = movie.Genre?.split(separator: ", ") ?? ["Adventure", "Comedy"]
                    HStack {
                        ForEach(genreList, id: \.self) { genre in
                            Text(genre).font(.system(size: 14.0)).foregroundColor(.white).padding(5)
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(.white), lineWidth: 1))
                                //  .cornerRadius(10)
                                .padding([.trailing], 15)
//                                .padding([.bottom], 100)
                            //                           Capsule().stroke(.white).overlay(.padding(.vertical).padding(.horizontal))
                        }
                    }
                
                
                ZStack
                {
                    Color("darkGrey").edgesIgnoringSafeArea(.all)
//                    Color(.white)
                    if let plot = movie.Plot{
                        Text(plot).font(.system(size: 12.0))
//                            .padding([.top], 10)
                            .padding([.leading], 20).padding([.trailing], 20).padding([.bottom], 20)
                            .foregroundColor(.white)
//                            .frame(alignment: .bottomLeading)
                    }
                }
//                .cornerRadius(10).frame(height: 300, alignment: .bottomLeading)
                   
                    //.foregroundColor(Color("lightGrey"))
            }
            
        }
        .ignoresSafeArea()
    }
}
