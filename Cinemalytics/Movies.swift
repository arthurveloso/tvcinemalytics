//
//  Movies.swift
//  Cinemalytics
//
//  Created by Arthur Melo on 24/01/17.
//  Copyright © 2017 arthurmelo. All rights reserved.
//

import Foundation

class Movies: NSObject{
    
    func getMoviesByYear(year: Int) {
        if let url = NSURL(string: "http://api.cinemalytics.in/v2/movie/year/\(year)/?auth_token=BD78E4BD510D84E92ED8077BEE08D5D2") {
            if let data = NSData(contentsOf: url as URL) {
                do {
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments)
                    
                    if let dictionary = parsed as? [String : AnyObject] {
                        print(dictionary)
                    }
                } catch let error as NSError {
                    print("Error parsing JSON \(error)")
                }
            }
        }
    }
}
