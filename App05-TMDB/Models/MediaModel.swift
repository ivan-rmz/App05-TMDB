//
//  MediaModel.swift
//  App05-TMDB
//
//  Created by user196198 on 9/27/21.
//

import SwiftUI
import Alamofire
import SwiftyJSON

class MediaModel: ObservableObject{
    
    @Published var genres = [Genre]()
    @Published var moviesNP = [Media]()
    @Published var seriesNP = [Media]()
    
    init(){
        loadGenres()
        loadMoviesNP()
        loadSeriesNP()
    }
    
    func loadGenres(){
        genres.removeAll()
        
        let URL = "\(tmdbURL)genre/movie/list?api_key=\(apikey)&language=en-US"
        
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in

            let json = try! JSON(data: data.data!)
//            print(json)
            var genre: Genre
            
            for j in json["genres"]{
                genre = Genre(id: j.1["id"].intValue, name: j.1["name"].stringValue)
//                print(genre.name)
                self.genres.append(genre)
            }
        }
    }
    
    func loadMoviesNP(){
            
        let URL = "\(tmdbURL)movie/now_playing?api_key=\(apikey)&language=en-US&page=1"
            
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in

        let json = try! JSON(data: data.data!)
            print(json)
                            
        var movie: Media
        for m in json["results"]{
            var genresIDs = [String]()
                    
            for g in m.1["genre_ids"]{
                if let index = self.genres.firstIndex(where: {$0.id == g.1.intValue}){
                    genresIDs.append(self.genres[index].name)
                }
            }
                    
            movie = Media(id: m.1["id"].intValue,
                            title: m.1["title"].stringValue,
                            overview: m.1["overview"].stringValue,
                            poster: m.1["poster_path"].stringValue,
                            rate: m.1["vote_average"].doubleValue,
                            genres: genresIDs,
                            releaseDate: m.1["release_dare"].stringValue)
                    self.moviesNP.append(movie)
                }
        }
    }

    func loadSeriesNP(){
            
            
    }
    
    func loadMoviePosters(id: Int, handler: @escaping(_ returnedImages: [String]) -> ()){

            
        // Movies Images
        let URL = "https://api.themoviedb.org/3/movie/\(id)/images?api_key=\(apikey)"
            
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in

            let json = try! JSON(data: data.data!)
                                
                var images = [String]()
            for image in json["posters"]{
                
                if image.1["width"].intValue == 2000 && image.1["iso_639_1"].stringValue == "en"{
                    images.append(image.1["file_path"].stringValue)
                }
                
            }
            handler(images)
        }
    }
    
    func loadMovieTrailers(id: Int, handler: @escaping(_ returnedTrailers: [Trailer]) -> ()){

        // Movies Trailers
        let URL = "https://api.themoviedb.org/3/movie/\(id)/videos?api_key=\(apikey)&language=en-US"
            
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in

            let json = try! JSON(data: data.data!)
                                
            var trailers = [Trailer]()
            var trailer: Trailer
            
            for t in json["results"]{
                trailer = Trailer(id: t.1["id"].stringValue,
                                  name: t.1["name"].stringValue,
                                  key: t.1["key"].stringValue,
                                  type: t.1["type"].stringValue)
                trailers.append(trailer)
            }
            
            trailers.sort {$0.type > $1.type}
            handler(trailers)
        }
    }
}
