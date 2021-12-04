//
//  TMDBLogin.swift
//  App05-TMDB
//
//  Created by user196198 on 9/27/21.
//

import Foundation

let apikey = "386fe0a7407b68f21e6e1568e0f2f5cc"
let apiauth = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzODZmZTBhNzQwN2I2OGYyMWU2ZTE1NjhlMGYyZjVjYyIsInN1YiI6IjYxNTFkNzIzNjcyMDNkMDAyOTZjY2IzNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zhLEbIZXj9_lu1QckcQVcQ_0IGB9LzVgETuskXzHD7U"
let headers = [
    "Authorization": "Bearer \(apiauth)",
    "Accept": "application/json",
    "Content-Type": "application/json" ]

let tmdbURL = "https://api.themoviedb.org/3/"
let imageURL = "https://image.tmdb.org/t/p/original"
let youtubeURL = "https://youtu.be/"
