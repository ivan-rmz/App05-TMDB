//
//  MediaRowView.swift
//  App05-TMDB
//
//  Created by user196198 on 9/27/21.
//

import SwiftUI
import Kingfisher

struct MediaRowView: View {
    
    var media: Media
    var width: CGFloat
    
    var body: some View {
        VStack {
            KFImage(URL(string: "\(imageURL)\(media.poster)"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width-40)
                .cornerRadius(40.0)
                .overlay(
                    ZStack{
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.green, style:
                                        StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                        VStack{
                            HStack{
                                Spacer()
                                AddToWatchList()
                                    .padding(.trailing, 20)
                                    .padding(.top, 20)
                            }
                            Spacer()
                        }
                        VStack{
                            Spacer()
                            HStack{
                                RateView(rate: media.rate * 10)
                                    .padding(.leading, 35)
                                    .padding(.bottom, -30)
                            }
                        }
                    }
                )
                .padding(.top, 10)
            Text(media.title)
                .font(.largeTitle)
                .frame(width: width-40)
                .multilineTextAlignment(.center)
                .padding(.top, 40)
            Text(media.releaseDate)
                .font(.headline)
                .padding(.top, 0)
        }
        .padding(.horizontal, 20)
        .onAppear{
            print("\(imageURL)\(media.poster)")
        }
    }
}

struct MediaRowView_Previews: PreviewProvider {
    static var previews: some View {
        MediaRowView(media: Media.dummy, width: 300.0)

    }
}
