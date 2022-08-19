//
//  MovieViewModel.swift
//  RestApp
//
//  Created by usuario on 18/8/22.
//

import Foundation

class MovieViewModel {

    private var apiService = ApiService()
    private var popularmovies = [Movie]()

    func fetchPopularMoviesData(completion: @escaping () -> ()) {
        apiService.getPopularMoviesData { [weak self] (result) in

            switch result {
            case .success(let listOf):
                self?.popularmovies = listOf.movies
                completion()
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }
    func numberOfRowsInSection(section: Int) -> Int {
        if popularmovies.count != 0 {
            return popularmovies.count
        }
        return 0
    }
}
