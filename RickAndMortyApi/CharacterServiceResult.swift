//
//  CharacterServiceResult.swift
//  RickAndMortyApi
//
//  Created by Buhle Radzilani on 2024/06/18.
//

import Foundation

struct CharacterServiceResult: Codable {
    let results: [Character]
}

struct Character: Codable {
    let id: Int
    let name: String
}
