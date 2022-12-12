//
//  StarRatingView.swift
//  personal_project
//
//  Created by Jordan Evans on 12/5/22.
//

import SwiftUI

struct StarRatingView: View {
    var rating: Double
    var body: some View {
        HStack{
            ForEach(starImages,id: \.self){ image in
                Image(systemName: image)
            }

        }
    }
    
    var starImages: Array<String> {
        var imageNames = [String]()
        var rate: Double = rating
        while rate >= 1.0{
            rate-=1
            imageNames.append("star.fill")
        }
        if rate >= 0.5 {
            rate = 0
            imageNames.append("star.leadinghalf.filled")
        } else {
            rate = 0
        }
        while imageNames.count < 5 {
            imageNames.append("star")
        }
        return imageNames
    }
}

struct StarRatingView_Previews: PreviewProvider {
    static var previews: some View {
        StarRatingView(rating: 3.7)
    }
}


