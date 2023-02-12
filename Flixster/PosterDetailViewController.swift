//
//  posterDetailViewController.swift
//  Flixster
//
//  Created by Kevin Velazco on 2/11/23.
//

import UIKit
import Nuke

class PosterDetailViewController: UIViewController {
    
    var poster: Poster!
    
    
    @IBOutlet weak var posterBackdropImageView: UIImageView!
    
    @IBOutlet weak var posterTitleLabel: UILabel!
    @IBOutlet weak var posterVoteAverageLabel: UILabel!
    @IBOutlet weak var posterVoteCountLabel: UILabel!
    @IBOutlet weak var posterPopularityLabel: UILabel!
    @IBOutlet weak var posterOverviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Nuke.loadImage(with: URL(string: "https://image.tmdb.org/t/p/original\(poster.backdrop_path)")!, into: posterBackdropImageView)
        
        posterTitleLabel.text = poster.title
        posterVoteAverageLabel.text = String(poster.vote_average)
        posterVoteCountLabel.text = String(poster.vote_count)
        posterPopularityLabel.text = String(poster.popularity)
        posterOverviewLabel.text = poster.overview
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
