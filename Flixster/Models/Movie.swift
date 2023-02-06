//
//  Movie.swift
//  Flixster
//
//  Created by Kevin Velazco on 2/5/23.
//

import Foundation

struct Movie {
    let title: String
    let overview: String
    let poster_path: URL
    
    // Detail properties
    let vote_average: Double
    let vote_count: Int
    let backdrop_path: URL
    let popularity: Double
}

extension Movie {

    /// An array of mock movies
    static var mockMovies: [Movie]  = [
        Movie(title: "Black Panther: Wakanda Forever",
              overview: "Queen Ramonda, Shuri, M’Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’Challa’s death.  As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.",
              poster_path: URL(string:"https://image.tmdb.org/t/p/original/sv1xJUazXeYqALzczSZ3O6nkH75.jpg")!,
              vote_average: 7.5,
             vote_count: 2389,
              backdrop_path: URL(string:"https://image.tmdb.org/t/p/original/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg")!,
              popularity: 7658.731),
        Movie(title: "Puss in Boots: The Last Wish",
              overview: "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.",
              poster_path: URL(string:"https://image.tmdb.org/t/p/original/kuf6dutpsT0vSVehic3EZIqkOBt.jpg")!,
              vote_average: 8.6,
             vote_count: 3229,
              backdrop_path: URL(string:"https://image.tmdb.org/t/p/original/faXT8V80JRhnArTAeYXz0Eutpv9.jpg")!,
              popularity: 5061.187),
        Movie(title: "M3GAN",
              overview: "A brilliant toy company roboticist uses artificial intelligence to develop M3GAN, a life-like doll programmed to emotionally bond with her newly orphaned niece. But when the doll's programming works too well, she becomes overprotective of her new friend with terrifying results.",
              poster_path: URL(string:"https://image.tmdb.org/t/p/original/d9nBoowhjiiYc4FBNtQkPY7c11H.jpg")!,
              vote_average: 7.6,
             vote_count: 1264,
              backdrop_path: URL(string:"https://image.tmdb.org/t/p/original/q2fY4kMXKoGv4CQf310MCxpXlRI.jpg")!,
              popularity: 3387.402),
        Movie(title: "Transfusion",
              overview: "Ryan Logan, a former Special Forces operative, is battling to cope with life after the loss of his wife.  He is thrusted into the criminal underworld to keep his only son from being taken from him.",
              poster_path: URL(string:"https://image.tmdb.org/t/p/original/bxh5xCCW9Ynfg6EZJWUkc1zqTnr.jpg")!,
              vote_average: 6.6,
             vote_count: 30,
              backdrop_path: URL(string:"https://image.tmdb.org/t/p/original/a4I481szRmycyreQTLrRe4f4YJe.jpg")!,
              popularity: 2087.429),
        Movie(title: "Avatar: The Way of Water",
              overview: "Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.",
              poster_path: URL(string:"https://image.tmdb.org/t/p/original/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg")!,
              vote_average: 7.7,
             vote_count: 4990,
              backdrop_path: URL(string:"https://image.tmdb.org/t/p/original/s16H6tpK2utvwDtzZ8Qy4qm5Emw.jpg")!,
              popularity: 1954.665)
    ]
}

// MARK: Helper Methods
/// Converts milliseconds to mm:ss format
///  ex:  208643 -> "3:28"
///  ex:
/*
func formattedTrackDuration(with milliseconds: Int) -> String {
    let (minutes, seconds) = milliseconds.quotientAndRemainder(dividingBy: 60 * 1000)
    let truncatedSeconds = seconds / 1000
    if truncatedSeconds >= 10 {
        return "\(minutes):\(truncatedSeconds)"
    } else {
        return "\(minutes):0\(truncatedSeconds)"
    }
}
*/
