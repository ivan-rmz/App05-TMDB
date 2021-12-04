//
//  ContentView.swift
//  App05-TMDB
//
//  Created by user196198 on 9/27/21.
//

import SwiftUI

struct TMDBView: View {
    
    @StateObject var mediaModel = MediaModel()
    
    var body: some View {
        NavigationView{
            TabView{
                MovieView(mediaModel: MediaModel())
                    .tabItem {
                        Label("Movies", systemImage: "film.fill")
                    }
                SeriesView()
                    .tabItem {
                        Label("Series", systemImage: "tv.fill")
                    }
                WatchListView()
                    .tabItem{
                        Label("WatchList", systemImage: "list.star")
                    }
            }
            .navigationBarTitle("Genres", displayMode: .inline)
        }
    }
}

struct TMDBView_Previews: PreviewProvider {
    static var previews: some View {
        TMDBView()
    }
}
