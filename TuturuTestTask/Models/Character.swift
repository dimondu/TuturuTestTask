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
    let data: [Data]
    let count: Int
    let totalPages: Int
    let nextPage: String
}

struct Data: Decodable {
    let films: [String]
    let shortFilms: [String]
    let tvShows: [String]
    let videoGames: [String]
    let parkAttractions: [String]
    let name: String
    let imageUrl: String
    let url: String
}

