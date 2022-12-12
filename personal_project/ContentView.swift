//  ContentView.swift
//  personal_project
//
//  Created by Jordan Evans on 9/13/22.

import SwiftUI
struct ContentView: View {
    @State var searchInput: String = ""
    @State var movies = [Movie]()
    init() {
            UITableView.appearance().backgroundColor = .clear
        }
    //change this to be a list of movies -> loop through movies and display each on a card
    //list type in Swift UI that wraps the VStack
    var body: some View {
        //            Color.black.edgesIgnoringSafeArea(.all)
        NavigationStack{
            ZStack{
                Color("darkGrey").edgesIgnoringSafeArea(.all)
                formView
            }
        }
       
    }
    
    var formView: some View {
        VStack {
            Text("Search").padding(20).font(.system(size: 28)).bold()
                .foregroundColor(.white)
            HStack{
                Button {
                    //  print("\(search)")
                    API.fetchMovie(term: "\(searchInput)") { result in
                        switch result {
                        case .success(let movies):
                            // print("hi")
                            // print("got Title:", movies)
                            self.movies = movies
                            print(movies.map(\.Poster))
                            // print("got Year:", Year)
                        case .failure(let error):
                            print("Fetching Title failed.", error)
                        }
                    }
                } label: {
                    Image(systemName:"magnifyingglass").resizable().foregroundColor(Color(.white))
                        .padding(15).frame(width: 45, height: 45)
                    // Text("search").padding(25)
                }
                TextField("Search For A Movie", text: $searchInput).foregroundColor(Color(.white))
                //  .searchable(text: $searchInput)
                
            }.background(Color("lightGrey")).cornerRadius(30).padding([.trailing], 20).padding([.leading], 20)
            
            List(movies) { movie in
                
                //STEP put within navigationLink with label
                //within navigation link add full movie view (in launch screen right now)
                
                NavigationLink(destination: fullMovieView(movie:movie)){
                    movieView(movie: movie)
                }
                .listRowBackground(Color("darkGrey"))
                
            }
            .background(Color("darkGrey"))
            .scrollContentBackground(.hidden)
            
        }
        .background { Color("darkGrey") }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    //rename to movie preview
    func movieView(movie: Movie) -> some View {
        VStack{
            
            ZStack{
                RoundedRectangle(cornerRadius:20)
                    .fill(Color("lightGrey"))
//                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color("Lightpink"), lineWidth: 2))
                
                HStack {
                    //image from json
                    AsyncImage(url: URL(string: movie.Poster)) { image in
                        image
                            .resizable().aspectRatio(contentMode: .fit)
                            .scaledToFit()
                        //    .frame(width: 150, height: 150, alignment: .bottomLeading)
                    } placeholder: {
                        Color.white
                            .opacity(0.2)
                    }
                    .cornerRadius(10)
                    .frame(width: 300/425*190, height: 190, alignment: .bottomLeading)
                    .padding(10)
                    Text(movie.Title).font(.system(size: 16.0)).foregroundColor(.white).bold()
                    Spacer()
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
