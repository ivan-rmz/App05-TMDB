//
//  TrailerView.swift
//  App05-TMDB
//
//  Created by Alumno on 30/09/21.
//

import SwiftUI

struct TrailerView: View {
    
    @Binding var trailers: [Trailer]
    
    var body: some View {
        List{
            ForEach(trailers){ trailer in
                NavigationLink(destination: WebView(html: "\(youtubeURL)\(trailer.key)"), label: {
                    VStack(alignment: .leading){
                        Text(trailer.name)
                        Text(trailer.type)
                    }
                })
            }
        }
    }
}

struct TrailerView_Previews: PreviewProvider {
    @State static var trailers = [Trailer]()
    static var previews: some View {
        TrailerView(trailers: $trailers)
    }
}
