//
//  AddToWatchList.swift
//  App05-TMDB
//
//  Created by user205865 on 10/18/21.
//

import SwiftUI

struct AddToWatchList: View {
    @Environment(\.managedObjectContext) var viewContext
    var fetchRequest: FetchRequest<Watchlist>
    var lists: FetchRequest<WatchList>{
        fetchRequest.wrappedVale
    }
    
    var media: Media
    
    var body: some View {
        VStack{
            Button {
                addWatchList()
            } label: {
                Image(systemName: "star")
                    .font(.largeTitle)
                    .foregroundColor(.yellow)
            }
        }
        .onAppear{
            
        }
    }
    
    init(filter: Media){
        media = filterfetchRequest = FetchRequestWatchList(entitty. WatchList.entity()),
        sortDescriptors: [
    }
}

struct AddToWatchList_Previews: PreviewProvider {
    static var previews: some View {
        AddToWatchList()
    }
}
