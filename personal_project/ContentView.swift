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
            Text("Search").font(.system(size: 25.0)).foregroundColor(.white)
                ZStack{
                   RoundedRectangle(cornerRadius:20).fill((Color("lightGrey")))
                    HStack{
                        //image from json
                        if let movies = Movie.movies {
                            AsyncImage(url: URL(string: movies.Poster)) { image in
                                    image
                                    .resizable().aspectRatio(contentMode: .fit)
                                    .scaledToFit().padding(.vertical).padding(.horizontal)
                                   .frame(width: 100, height: 100, alignment: .bottomLeading)

                            } placeholder: {
                                Color.red
                            } .frame(maxWidth: 80, alignment: .bottomLeading)
                        }
                        //categories from json
                        if let movies = Movie.movies {
                            let genreList = movies.Genre?.split(separator: ",") ?? []
                            Capsule().stroke(.white).frame(width: 70, height: 40).overlay(Text(genreList[0]).font(.system(size: 12.0)).foregroundColor(.white).padding(.vertical).padding(.horizontal))
                            Capsule().stroke(.white).frame(width: 95, height: 40).overlay(Text(genreList[1]).font(.system(size: 12.0)).foregroundColor(.white).padding(.vertical).padding(.horizontal))
                            Capsule().stroke(.white).frame(width: 85, height: 40).overlay(Text(genreList[2]).font(.system(size: 12.0)).foregroundColor(.white).padding(.vertical).padding(.horizontal))
                        }
                        
                        
                        
                        
                } .foregroundColor(Color("lightGrey"))
            }
            ZStack {
                RoundedRectangle(cornerRadius:20).fill((Color("lightGrey")))
               Text("Get Out").font(.system(size: 20.0)).foregroundColor(.white)
                Image("getOut").resizable().scaledToFit().padding(.vertical).padding(.horizontal)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            }
        } .onAppear() {
            API.fetchMovie(term: "princess") { result in
                switch result {
                case .success(let Title):
                    print("got Title:", Title)
                case .failure(let error):
                    print("Fetching Title failed.", error)
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical)
        //  .foregroundColor(Color("lightGrey"))
        //  .background(Rectangle().foregroundColor(Color("darkGrey")))
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

    




//}

//                ZStack {
//                    RoundedRectangle(cornerRadius:20).fill()
//                   Text("Everything Everywhere All at Once").font(.system(size: 20.0)).foregroundColor(.white)
//                    Image("everythingEverywhere").resizable().scaledToFit().padding(.vertical).padding(.horizontal)
//                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
//                    }
