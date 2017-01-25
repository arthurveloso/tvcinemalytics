//
//  FirstViewController.swift
//  Cinemalytics
//
//  Created by Arthur Melo on 24/01/17.
//  Copyright © 2017 arthurmelo. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var moviesReleasedThisWeek: [Movies] = []
    
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupTitle(movie: Movies) {
        self.movieName.text = movie.title
        self.movieGenre.text = movie.genre
        self.imageBackground.downloadedFrom(link: movie.posterPath!)
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
        cell.movie = moviesReleasedThisWeek[indexPath.item]
        cell.controller = self
        
        return cell
    }
}

