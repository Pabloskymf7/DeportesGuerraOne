//
//  SportDataSource.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 3/4/25.
//

import Foundation

class SportDataSource: SportDataSourceProtocol {
    let apiKey = "ptN1LBeWONwOWqCGPHkk9A==DSII6rbIsE3IIqjL"
    func getExercises() async throws -> [ExerciseDTO] {
        let data = try await loadData(with: "?muscle=biceps")
        let response = try JSONDecoder().decode([ExerciseDTO].self, from: data)
        return response
    }

    func loadData(with endpoint: String) async throws -> Data {
        guard let url = URL(string: "\(Constant.baseUrl)\(endpoint)") else {
            throw NetworkError.invalidUrl
        }
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
}

