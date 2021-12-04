//
//  MovieView.swift
//  App05-TMDB
//
//  Created by user196198 on 9/27/21.
//

import SwiftUI
import Kingfisher

struct MovieView: View {
    
    @StateObject var mediaModel: MediaModel
    
    var body: some View {
        GeometryReader{ geo in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(mediaModel.moviesNP) { movie in
                        NavigationLink(destination: MediaDetailView(mediaModel: mediaModel, media: movie)) {
                            MediaRowView(media: movie, width: geo.size.width)
                        }
                    }
                }
            }
            .navigationBarTitle("Movies", displayMode: .inline)
        }
        
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(mediaModel: MediaModel())
    }
}
