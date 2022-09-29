//
//  Character.swift
//  TuturuTestTask
//
//  Created by Дмитрий Дуров on 28.09.2022.
//

import Foundation

enum Link: String {
    
    case characterURL = "https://api.disneyapi.dev/characters"
}

struct Character: Decodable {
    let data: [DataCharacter]
    let count: Int
    let totalPages: Int
    let nextPage: String
}

struct DataCharacter: Decodable {
    let films: [String]
    let shortFilms: [String]
    let tvShows: [String]
    let videoGames: [String]
    let parkAttractions: [String]
    let name: String
    let imageUrl: String
    let url: String
}

