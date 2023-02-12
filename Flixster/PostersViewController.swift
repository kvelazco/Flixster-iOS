//
//  PostersViewController.swift
//  Flixster
//
//  Created by Kevin Velazco on 2/11/23.
//

import UIKit
import Nuke

class PostersViewController: UIViewController, UICollectionViewDataSource {

    var posters: [Poster] = []
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=d3ae243de5776e5ecdeee1c6092bf1f9")!
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }

            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }

            // Create a JSON Decoder
            let decoder = JSONDecoder()
            do {
                // Try to parse the response into our custom model
                let response = try decoder.decode(PosterSearchResponse.self, from: data)
                let posters = response.results
                DispatchQueue.main.async {
                    self?.posters = posters // <-- Reload data after the line where we set the albums property
                    self?.collectionView.reloadData()
                }
                print(posters)
            } catch {
                print(error.localizedDescription)
            }
        }

        // Initiate the network request
        task.resume()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        // The minimum spacing between adjacent cells (left / right, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumInteritemSpacing = 0

        // The minimum spacing between adjacent cells (top / bottom, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumLineSpacing = 0

        // Set this to however many columns you want to show in the collection.
        let numberOfColumns: CGFloat = 3

        // Calculate the width each cell need to be to fit the number of columns, taking into account the spacing between cells.
        let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns

        // Set the size that each tem/cell should display at
        layout.itemSize = CGSize(width: width, height: width*2)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        posters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell

        // Use the indexPath.item to index into the albums array to get the corresponding album
        let poster = posters[indexPath.item]

        // Get the artwork image url
        let imageUrl = poster.poster_path

        // Set the image on the image view of the cell
        Nuke.loadImage(with: URL(string:"https://image.tmdb.org/t/p/original\(imageUrl)")!, into: cell.posterImageView)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        if let cell = sender as? UICollectionViewCell,
           // Get the index path of the cell from the table view
           let indexPath = collectionView.indexPath(for: cell),
           // Get the detail view controller
           let posterDetailViewController = segue.destination as? PosterDetailViewController {

            // Use the index path to get the associated track
            let poster = posters[indexPath.row]

            // Set the track on the detail view controller
            posterDetailViewController.poster = poster
        }
    }
    /*
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = collectionView.indexPathForSelectedRow {

            collectionView.deselectRow(at: indexPath, animated: true)
        }
    }
     */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
