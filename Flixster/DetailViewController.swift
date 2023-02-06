//
//  DetailViewController.swift
//  Flixster
//
//  Created by Kevin Velazco on 2/5/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    
    var movie: Movie!
    
    @IBOutlet weak var backdropImageView: UIImageView!
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var voteCountLabel: UILabel!
    @IBOutlet weak var moviePopularityLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Nuke.loadImage(with: movie.backdrop_path, into: backdropImageView)
        
        movieTitleLabel.text = movie.title
        voteAverageLabel.text = String(movie.vote_average)
        voteCountLabel.text = String(movie.vote_count)
        moviePopularityLabel.text = String(movie.popularity)
        movieOverviewLabel.text = movie.overview
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
