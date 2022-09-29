//
//  NetworkManager.swift
//  TuturuTestTask
//
//  Created by Дмитрий Дуров on 28.09.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case noData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCharacter(url: String?, completion: @escaping(Result<Character, NetworkError>) -> Void) {
        guard let urlString = url, let url = URL(string: urlString) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "no error description")
                return
            }
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let character = try decoder.decode(Character.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(character))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
