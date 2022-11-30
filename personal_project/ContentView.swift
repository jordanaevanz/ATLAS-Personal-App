//  ContentView.swift
//  personal_project
//
//  Created by Jordan Evans on 9/13/22.

import SwiftUI
struct ContentView: View {
    @State var searchInput: String = ""
    //change movie to an array of movies
    @State var movie = Movie.movie
    @State var movies = [Movie]()
    
    //change this to be a list of movies -> loop through movies and display each on a card
    //list type in Swift UI that wraps the VStack
    var body: some View {
        
        
        //STEP enclose in navigation stack
        Text("Search").padding(20).font(.system(size: 28))
        HStack{
            Button {
                //  print("\(search)")
                API.fetchMovie(term: "\(searchInput)") { result in
                    switch result {
                    case .success(let movies):
                        // print("hi")
                        // print("got Title:", movies)
                        self.movies = movies
                        // print("got Year:", Year)
                    case .failure(let error):
                        print("Fetching Title failed.", error)
                    }
                }
            } label: {
                Image("searchIcon").resizable()
                    .padding(15).frame(width: 45, height: 45)
                // Text("search").padding(25)
            }
            TextField("Search For A Movie", text: $searchInput)
                .searchable(text: $searchInput)
            
        }.background(Color("heatherGrey")).cornerRadius(30).padding([.trailing], 20).padding([.leading], 20)
        List(movies) { movie in
            //STEP put within navigationLink with label
            //within navigation link add full movie view (in launch screen right now)
            
            NavigationLink(destination: fullMovieView(movie:movie)){
                movieView(movie: movie)
            }.background(Color.black)
        
        }
    }
        //rename to movie preview
        func movieView(movie: Movie) -> some View {
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius:20).fill((Color("lightGrey")))
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
//                        let genreList = movie.Genre?.split(separator: ",") ?? ["Adventure", "Comedy"]
//                        HStack {
//                            ForEach(genreList, id: \.self) { genre in
//                                Text(genre).font(.system(size: 14.0)).foregroundColor(.white).padding(4)
//                                    .background(Color.pink)
//                                    .cornerRadius(10)
//                                    .padding([.trailing], 15)
//
//                                //                           Capsule().stroke(.white).overlay(.padding(.vertical).padding(.horizontal))
//                            }
//                        }
                        
                    } //.foregroundColor(Color("lightGrey"))
                }
            }
        }
    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

    

//to use symbols on swift do Image(systemName: " ")
