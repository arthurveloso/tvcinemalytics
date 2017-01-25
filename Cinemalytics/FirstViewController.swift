//
//  FirstViewController.swift
//  Cinemalytics
//
//  Created by Arthur Melo on 24/01/17.
//  Copyright © 2017 arthurmelo. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var moviesReleasedByYear: [Movies] = []
    var moviesReleasedThisWeek: [Movies] = []
    var moviesReleasedNextWeek: [Movies] = []
    var moviesUpcoming: [Movies] = []
    
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //moviesReleasedByYear = Movies.getMoviesByYear(year: 2014)
        moviesReleasedThisWeek = Movies.getMoviesReleasedThisWeek()
        //moviesReleasedNextWeek = Movies.getMoviesNextWeek()
        //moviesUpcoming = Movies.getUpcomingMovies()
        //print(moviesReleasedThisWeek[0].title!)
        //print(moviesReleasedNextWeek[0].title!)
        //print(moviesUpcoming[1].title!)
        //getMoviesByYear(year: 2014)
    }

//    func getMoviesByYear(year: Int) {
//        if let url = NSURL(string: "http://api.cinemalytics.in/v2/movie/year/\(year)/?auth_token=BD78E4BD510D84E92ED8077BEE08D5D2") {
//            if let data = NSData(contentsOf: url as URL) {
//                do {
//                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments)
//                    
//                    if let dictionary = parsed as? [[String : Any]] {
//                        movies = Movies.modelsFromDictionaryArray(array: dictionary as NSArray)
//                    }
//                } catch let error as NSError {
//                    print("Error parsing JSON \(error)")
//                }
//            }
//        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension FirstViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.moviesReleasedThisWeek.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "week", for: indexPath) as! WeekMoviesCell
        
        self.imageBackground.downloadedFrom(link: moviesReleasedThisWeek[indexPath.item].posterPath!)
        
        cell.movieImage.adjustsImageWhenAncestorFocused = true
        
        cell.movieImage.downloadedFrom(link: moviesReleasedThisWeek[indexPath.item].posterPath!)
        self.movieName.text = moviesReleasedThisWeek[indexPath.item].title!
        self.movieGenre.text = moviesReleasedThisWeek[indexPath.item].genre!
        
        return cell
    }
}

