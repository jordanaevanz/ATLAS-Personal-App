//
//  ContentView.swift
//  personal_project
//
//  Created by Jordan Evans on 9/13/22.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
            VStack{

                
                Text("Discover").font(.system(size: 25.0)).foregroundColor(.white)
                ZStack{
                    RoundedRectangle(cornerRadius:20).fill()
                    HStack{
                        if let movies = Movie.movies {
                            AsyncImage(url: URL(string: movies.Poster)) { image in
                                    image
                        //.resizable().aspectRatio(2)
                                   // .scaledToFit().padding(.vertical).padding(.horizontal)
//                                   .frame(width: 100, height: 100, alignment: .bottomLeading)

                            } placeholder: {
                                Color.red
                            } .frame(maxWidth: 80, alignment: .bottomLeading)
                       
                       // if let movies = Movie.movies {
                            let genreList = movies.Genre.split(separator: ",")
                            Capsule().stroke(.white).frame(width: 80, height: 40).overlay(Text(genreList[0]).font(.system(size: 16.0)).foregroundColor(.white).padding(.vertical).padding(.horizontal))
                            Capsule().stroke(.white).frame(width: 80, height: 40).overlay(Text(genreList[1]).font(.system(size: 16.0)).foregroundColor(.white).padding(.vertical).padding(.horizontal))
                            Capsule().stroke(.white).frame(width: 80, height: 40).overlay(Text(genreList[2]).font(.system(size: 16.0)).foregroundColor(.white).padding(.vertical).padding(.horizontal))
                            }.onAppear() {
                                API.fetchMovie { result in
                                    switch result {
                                    case .success(let Title):
                                        print("got Title:", Title)
                                    case .failure(let error):
                                        print("Fetching Title failed.", error)
                        }
                }
                ZStack {
                    RoundedRectangle(cornerRadius:20).fill()
//                    Text("Get Out").font(.system(size: 20.0)).foregroundColor(.white)
                    Image("getOut").resizable().scaledToFit().padding(.vertical).padding(.horizontal)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                }
                ZStack {
                    RoundedRectangle(cornerRadius:20).fill()
//                    Text("Everything Everywhere All at Once").font(.system(size: 20.0)).foregroundColor(.white)
                    Image("everythingEverywhere").resizable().scaledToFit().padding(.vertical).padding(.horizontal)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                }
            }
        .padding(.horizontal)
        .padding(.vertical)
        .foregroundColor(Color("lightGrey"))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}
