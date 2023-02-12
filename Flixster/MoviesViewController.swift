//
//  ViewController.swift
//  Flixster
//
//  Created by Kevin Velazco on 2/5/23.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDataSource {

    var movies: [Movie] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

            do {
                
                let decoder = JSONDecoder()
                
                let response = try decoder.decode(MoviesResponse.self, from: data)

                let movies = response.results
                
                DispatchQueue.main.async {

                    self?.movies = movies

                    self?.tableView.reloadData()
                }
                
            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
        }
        task.resume()
        print("👋 Below the closure")
        
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell

        let movie = movies[indexPath.row]

        cell.configure(with: movie)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        if let cell = sender as? UITableViewCell,
           // Get the index path of the cell from the table view
           let indexPath = tableView.indexPath(for: cell),
           // Get the detail view controller
           let detailViewController = segue.destination as? DetailViewController {

            // Use the index path to get the associated track
            let movie = movies[indexPath.row]

            // Set the track on the detail view controller
            detailViewController.movie = movie
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {

            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
}
