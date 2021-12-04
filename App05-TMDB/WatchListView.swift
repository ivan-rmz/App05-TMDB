//
//  WatchListView.swift
//  App05-TMDB
//
//  Created by user205865 on 10/18/21.
//

import SwiftUI

struct WatchListView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \WatchList.releaseDate, ascending: true)],
        animation: .default)
    private var multimedia: FetchedResults<WatchList>
    
    var body: some View {
        List{
            ForEach(multimedia) {media in
                Text(media.title_wrapped)
            }
        }
    }
}

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListView()
    }
}
