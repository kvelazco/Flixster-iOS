//
//  PosterCell.swift
//  Flixster
//
//  Created by Kevin Velazco on 2/11/23.
//

import UIKit
import Nuke

class PosterCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with poster: Poster) {
        Nuke.loadImage(with: URL(string:"https://image.tmdb.org/t/p/original\(poster.poster_path)")!, into: posterImageView)
    }
}
