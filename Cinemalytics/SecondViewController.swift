//
//  SecondViewController.swift
//  Cinemalytics
//
//  Created by Arthur Melo on 24/01/17.
//  Copyright © 2017 arthurmelo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var imageBackground: UIImageView!
    
    var moviesReleasedNextWeek: [Movies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        moviesReleasedNextWeek = Movies.getMoviesNextWeek()
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

extension SecondViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.moviesReleasedNextWeek.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "next-week", for: indexPath) as! WeekMoviesCell
        
        self.imageBackground.downloadedFrom(link: moviesReleasedNextWeek[indexPath.item].posterPath!)
        
        cell.movieImage.downloadedFrom(link: moviesReleasedNextWeek[indexPath.item].posterPath!)
        cell.movieImage.adjustsImageWhenAncestorFocused = true
        self.movieName.text = moviesReleasedNextWeek[indexPath.item].title!
        self.movieGenre.text = moviesReleasedNextWeek[indexPath.item].genre!
        
        cell.movie = moviesReleasedNextWeek[indexPath.item]
        cell.controller = self
        
        return cell
    }
}

