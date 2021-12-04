//
//  Media.swift
//  App05-TMDB
//
//  Created by user196198 on 9/27/21.
//

import SwiftUI

struct Media: Identifiable{
    var id: Int
    var title: String
    var overview: String
    var poster: String
    var rate: Double
    var genres: [String]
    var releaseDate: String
}

extension Media{
    static let dummy = Media(id: 631843, title: "Old", overview: "A group of families on a tropical holiday discover that the secluded beach where they are staying is somehow causing them to age rapidly – reducing their entire lives into a single day.", poster: "/qPKw2w4Ya5ZoOaxUDK1czRskQBT.jpg", rate: 6.7, genres: ["Mystery","Thriller","Horror"], releaseDate: "2021-07-21")
}
