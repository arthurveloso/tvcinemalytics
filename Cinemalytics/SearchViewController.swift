//
//  SearchViewController.swift
//  Cinemalytics
//
//  Created by Arthur Melo on 25/01/17.
//  Copyright © 2017 arthurmelo. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var yearInputed: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var searchedMovies: [Movies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupTitle(movie: Movies) {
        self.movieName.text = movie.title
        self.movieGenre.text = movie.genre
    }
    
    @IBAction func search(_ sender: UIButton) {
        searchedMovies = Movies.getMoviesByYear(year: Int(yearInputed.text!)!)
        collectionView.reloadData()
    }
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.searchedMovies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "search", for: indexPath) as! WeekMoviesCell
        
            cell.movieImage.downloadedFrom(link: searchedMovies[indexPath.item].posterPath!)
            cell.movieImage.adjustsImageWhenAncestorFocused = true
            self.movieName.text = searchedMovies[indexPath.item].title!
            self.movieGenre.text = searchedMovies[indexPath.item].genre!
            cell.movie = searchedMovies[indexPath.item]
            cell.controller = self

        return cell
    }
}
