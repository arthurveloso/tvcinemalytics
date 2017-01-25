//
//  ThirdViewController.swift
//  Cinemalytics
//
//  Created by Arthur Melo on 25/01/17.
//  Copyright © 2017 arthurmelo. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var moviesUpcoming: [Movies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        moviesUpcoming = Movies.getUpcomingMovies()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setupTitle(movie: Movies) {
        self.movieName.text = movie.title
        self.movieGenre.text = movie.genre
        self.backgroundImage.downloadedFrom(link: movie.posterPath!)
    }
}

extension ThirdViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.moviesUpcoming.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcoming", for: indexPath) as! WeekMoviesCell
        
        self.backgroundImage.downloadedFrom(link: moviesUpcoming[indexPath.item].posterPath!)
        
        cell.movieImage.downloadedFrom(link: moviesUpcoming[indexPath.item].posterPath!)
        cell.movieImage.adjustsImageWhenAncestorFocused = true
        self.movieName.text = moviesUpcoming[indexPath.item].title!
        self.movieGenre.text = moviesUpcoming[indexPath.item].genre!
        cell.movie = moviesUpcoming[indexPath.item]
        cell.controller = self
        return cell
    }
}
