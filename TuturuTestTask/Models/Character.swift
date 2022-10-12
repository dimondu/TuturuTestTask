//
//  Character.swift
//  TuturuTestTask
//
//  Created by Дмитрий Дуров on 28.09.2022.
//

import Foundation
import RealmSwift

enum Link: String {
    
    case characterURL = "https://api.disneyapi.dev/characters"
}

class Character: Object, Codable {
    @Persisted var data: List<DataCharacter>
    @Persisted var count: Int
    @Persisted var totalPages: Int
    @Persisted var nextPage: String
    
    convenience init(data: List<DataCharacter>) {
        self.init()
        self.data = data
    }
}

class DataCharacter: Object, Codable {
    @Persisted var films: List<String>
    @Persisted var tvShows: List<String>
    @Persisted var videoGames: List<String>
    @Persisted var name: String
    @Persisted var imageUrl: String
    
    convenience init(films: List<String>, tvShows: List<String>, videoGames: List<String>, name: String, imageUrl: String) {
        self.init()
        self.films = films
        self.tvShows = tvShows
        self.videoGames = videoGames
        self.name = name
        self.imageUrl = imageUrl
    }
}

