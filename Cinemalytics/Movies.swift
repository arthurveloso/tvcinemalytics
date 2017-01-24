//
//  Movies.swift
//  Cinemalytics
//
//  Created by Arthur Melo on 24/01/17.
//  Copyright © 2017 arthurmelo. All rights reserved.
//

import Foundation

class Movies: NSObject{
    
    public var id : String?
    public var imdbId : String?
    public var originalTitle : String?
    public var title : String?
    public var desc : String?
    public var trailerLink : String?
    public var trailerEmbedCode : String?
    public var country : String?
    public var region : String?
    public var genre : String?
    public var ratingCount : Int?
    public var rating : Int?
    public var totalCriticReviews : Int?
    public var censorRating : String?
    public var releaseDate : String?
    public var releaseDateAvailable : Int?
    public var releaseYear : Int?
    public var runtime : Int?
    public var budget : Int?
    public var revenue : Int?
    public var posterPath : String?
    public var posterReleased : Int?
    public var lastUpdateTime : String?
    
    required public init?(dictionary: NSDictionary) {
        id = dictionary["Id"] as? String
        imdbId = dictionary["ImdbId"] as? String
        originalTitle = dictionary["OriginalTitle"] as? String
        title = dictionary["Title"] as? String
        desc = dictionary["Description"] as? String
        trailerLink = dictionary["TrailerLink"] as? String
        trailerEmbedCode = dictionary["TrailerEmbedCode"] as? String
        country = dictionary["Country"] as? String
        region = dictionary["Region"] as? String
        genre = dictionary["Genre"] as? String
        ratingCount = dictionary["RatingCount"] as? Int
        rating = dictionary["Rating"] as? Int
        totalCriticReviews = dictionary["TotalCriticReviews"] as? Int
        censorRating = dictionary["CensorRating"] as? String
        releaseDate = dictionary["ReleaseDate"] as? String
        releaseDateAvailable = dictionary["ReleaseDateAvailable"] as? Int
        releaseYear = dictionary["ReleaseYear"] as? Int
        runtime = dictionary["Runtime"] as? Int
        budget = dictionary["Budget"] as? Int
        revenue = dictionary["Revenue"] as? Int
        posterPath = dictionary["PosterPath"] as? String
        posterReleased = dictionary["PosterReleased"] as? Int
        lastUpdateTime = dictionary["LastUpdateTime"] as? String
    }
    
    public class func modelsFromDictionaryArray(array: NSArray) -> [Movies] {
        var movies : [Movies] = []
        for item in array
        {
            movies.append(Movies(dictionary: item as! NSDictionary)!)
        }
        return movies
    }
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.id, forKey: "Id")
        dictionary.setValue(self.imdbId, forKey: "ImdbId")
        dictionary.setValue(self.originalTitle, forKey: "OriginalTitle")
        dictionary.setValue(self.title, forKey: "Title")
        dictionary.setValue(self.desc, forKey: "Description")
        dictionary.setValue(self.trailerLink, forKey: "TrailerLink")
        dictionary.setValue(self.trailerEmbedCode, forKey: "TrailerEmbedCode")
        dictionary.setValue(self.country, forKey: "Country")
        dictionary.setValue(self.region, forKey: "Region")
        dictionary.setValue(self.genre, forKey: "Genre")
        dictionary.setValue(self.ratingCount, forKey: "RatingCount")
        dictionary.setValue(self.rating, forKey: "Rating")
        dictionary.setValue(self.totalCriticReviews, forKey: "TotalCriticReviews")
        dictionary.setValue(self.censorRating, forKey: "CensorRating")
        dictionary.setValue(self.releaseDate, forKey: "ReleaseDate")
        dictionary.setValue(self.releaseDateAvailable, forKey: "ReleaseDateAvailable")
        dictionary.setValue(self.releaseYear, forKey: "ReleaseYear")
        dictionary.setValue(self.runtime, forKey: "Runtime")
        dictionary.setValue(self.budget, forKey: "Budget")
        dictionary.setValue(self.revenue, forKey: "Revenue")
        dictionary.setValue(self.posterPath, forKey: "PosterPath")
        dictionary.setValue(self.posterReleased, forKey: "PosterReleased")
        dictionary.setValue(self.lastUpdateTime, forKey: "LastUpdateTime")
        
        return dictionary
    }
    
    // Retorna filmes lançados em um ano x
    public class func getMoviesByYear(year: Int) -> [Movies] {
        var movies: [Movies] = []
        
        if let url = NSURL(string: "http://api.cinemalytics.in/v2/movie/year/\(year)/?auth_token=BD78E4BD510D84E92ED8077BEE08D5D2") {
            if let data = NSData(contentsOf: url as URL) {
                do {
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments)
                    if let dictionary = parsed as? [[String : Any]] {
                        movies = Movies.modelsFromDictionaryArray(array: dictionary as NSArray)
                        //print(movies)
                    }
                } catch let error as NSError {
                    print("Error parsing JSON \(error)")
                }
            }
        }
        return movies
    }
    
    // Retorna filmes lançados na semana
    public class func getMoviesReleasedThisWeek() -> [Movies] {
        var movies: [Movies] = []
        
        if let url = NSURL(string: "http://api.cinemalytics.in/v2/movie/releasedthisweek?auth_token=BD78E4BD510D84E92ED8077BEE08D5D2") {
            if let data = NSData(contentsOf: url as URL) {
                do {
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments)
                    if let dictionary = parsed as? [[String : Any]] {
                        movies = Movies.modelsFromDictionaryArray(array: dictionary as NSArray)
                        //print(movies)
                    }
                } catch let error as NSError {
                    print("Error parsing JSON \(error)")
                }
            }
        }
        return movies
    }
    
    // Retorna filmes que lançarão na próxima semana
    public class func getMoviesNextWeek() -> [Movies] {
        var movies: [Movies] = []
        
        if let url = NSURL(string: "http://api.cinemalytics.in/v2/movie/nextchange?auth_token=BD78E4BD510D84E92ED8077BEE08D5D2") {
            if let data = NSData(contentsOf: url as URL) {
                do {
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments)
                    if let dictionary = parsed as? [[String : Any]] {
                        movies = Movies.modelsFromDictionaryArray(array: dictionary as NSArray)
                        //print(movies)
                    }
                } catch let error as NSError {
                    print("Error parsing JSON \(error)")
                }
            }
        }
        return movies
    }
    
    // Retorna filmes que serão lançados no futuro
    public class func getUpcomingMovies() -> [Movies] {
        var movies: [Movies] = []
        
        if let url = NSURL(string: "http://api.cinemalytics.in/v2/movie/upcoming?auth_token=BD78E4BD510D84E92ED8077BEE08D5D2") {
            if let data = NSData(contentsOf: url as URL) {
                do {
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments)
                    if let dictionary = parsed as? [[String : Any]] {
                        movies = Movies.modelsFromDictionaryArray(array: dictionary as NSArray)
                        //print(movies)
                    }
                } catch let error as NSError {
                    print("Error parsing JSON \(error)")
                }
            }
        }
        return movies
    }
    
    override var description: String {
        return "\(self.title)"
    }
    
    
}
