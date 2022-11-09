//
//  ContentView.swift
//  personal_project
//
//  Created by Jordan Evans on 9/13/22.
//

import SwiftUI
struct ContentView: View {
    @State var searchInput: String = ""
    //change movie to an array of movies
    @State var movie = Movie.movie
    @State var movies = [Movie]()

    
    //change this to be a list of movies -> loop through movies and display each on a card
    //list type in Swift UI that wraps the VStack
    var body: some View {
        TextField("Enter A Movie", text: $searchInput)
            .searchable(text: $searchInput)
        Button {
            //  print("\(search)")
              API.fetchMovie(term: "\(searchInput)") { result in
                  switch result {
                  case .success(let movies):
//                      print("hi")
//                      print("got Title:", movies)
                      self.movies = movies
                      
  //                    print("got Year:", Year)
  //                    Image(Poster).resizable().scaledToFit().padding(.vertical).padding(.horizontal)
  //                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                  case .failure(let error):
                      print("Fetching Title failed.", error)
                  }
              }
        } label: {
            Text("search")
        }
        List(movies) { movie in
            movieView(movie: movie)
        }
//        .onAppear() {
//          //  print("\(search)")
//            API.fetchMovie(term: "\(searchInput)") { result in
//                switch result {
//                case .success(let movies):
//                    print("hi")
//                    print("got Title:", movies)
//                    self.movies = movies
//
////                    print("got Year:", Year)
////                    Image(Poster).resizable().scaledToFit().padding(.vertical).padding(.horizontal)
////                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
//                case .failure(let error):
//                    print("Fetching Title failed.", error)
//                }
//            }
//        }
        //  .foregroundColor(Color("lightGrey"))
        //  .background(Rectangle().foregroundColor(Color("darkGrey")))
    }
    
    func movieView(movie: Movie) -> some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius:20).fill((Color("lightGrey")))
                HStack{
                    //image from json
                    AsyncImage(url: URL(string: movie.Poster)) { image in
                        image
                            .resizable().aspectRatio(contentMode: .fit)
                            .scaledToFit().padding(.vertical).padding(.horizontal)
                            .frame(width: 150, height: 150, alignment: .bottomLeading)
                    } placeholder: {
                        Color.red
                    } .frame(maxWidth: 80, alignment: .bottomLeading)
                    //categories from json
                    let genreList = movie.Genre?.split(separator: ",") ?? ["Adventure", "Comedy"]
                    HStack {
                        ForEach(genreList, id: \.self) { genre in
                            Text(genre).font(.system(size: 12.0)).foregroundColor(.white)
                                .background(Color.pink)
                                .padding(12)
                                .cornerRadius(12)
                            //                           Capsule().stroke(.white).overlay(.padding(.vertical).padding(.horizontal))
                        }
                    }
                    
                } .foregroundColor(Color("lightGrey"))
            }
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

    

