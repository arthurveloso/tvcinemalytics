//
//  WeekMoviesCell.swift
//  Cinemalytics
//
//  Created by Arthur Melo on 25/01/17.
//  Copyright © 2017 arthurmelo. All rights reserved.
//

import UIKit

class WeekMoviesCell: UICollectionViewCell {
    
    weak var controller: UIViewController?
    
    var movie: Movies?
    
    @IBOutlet weak var movieImage: UIImageView!
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        coordinator.addCoordinatedAnimations({
            if let movie = self.movie {
                if self.isFocused {
                (self.controller as? FirstViewController)?.setupTitle(movie: movie)
                (self.controller as? SecondViewController)?.setupTitle(movie: movie)
                (self.controller as? ThirdViewController)?.setupTitle(movie: movie)
                (self.controller as? SearchViewController)?.setupTitle(movie: movie)
                }
            }
        }, completion: nil)
    }
}
