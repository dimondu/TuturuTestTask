//
//  Character.swift
//  TuturuTestTask
//
//  Created by Дмитрий Дуров on 28.09.2022.
//

import Foundation

enum Link: String {
    
    case memesURL =  "https://api.disneyapi.dev/characters"
}

struct Character {
    let data: [Data]
    let count: Int
    let totalPages: Int
    let nextPages: String
}

struct Data {
    let films: [String]
    let shortFilms: [String]
    let tvShows: [String]
    let videoGames: [String]
    let parkAttractions: [String]
    let allies: [String]
    let enemies: [String]
    let id: Int
    let name: String
    let imageUrl: String
    let url: String
}
