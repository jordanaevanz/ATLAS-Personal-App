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
//                if let movies = Movie.movies {
//                    Text("Hello, \(movies.Title)!")
//                } else {
//                    Text("No person found.")
//                }
//                
                Text("Rating Movies").font(.system(size: 40.0))
                ZStack{
                    RoundedRectangle(cornerRadius:20).fill()
                    HStack{
                        Image("kissingBooth").resizable().scaledToFit().padding(.vertical).padding(.horizontal)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                        if let movies = Movie.movies{
                            Text(movies.Title).font(.system(size: 20.0)).foregroundColor(.white).padding(.vertical).padding(.horizontal)
                            }
                        }
                }
                ZStack {
                    RoundedRectangle(cornerRadius:20).fill()
                    Text("Get Out").font(.system(size: 20.0)).foregroundColor(.white)
                    Image("getOut").resizable().scaledToFit().padding(.vertical).padding(.horizontal)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                }
                ZStack {
                    RoundedRectangle(cornerRadius:20).fill()
                    Text("Everything Everywhere All at Once").font(.system(size: 20.0)).foregroundColor(.white)
                    Image("everythingEverywhere").resizable().scaledToFit().padding(.vertical).padding(.horizontal)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                }
            }
        .padding(.horizontal)
        .padding(.vertical)
        .foregroundColor(.gray)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}
