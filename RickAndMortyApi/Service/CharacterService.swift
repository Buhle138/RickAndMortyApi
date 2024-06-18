//
//  CharacterService.swift
//  RickAndMortyApi
//
//  Created by Buhle Radzilani on 2024/06/18.
//

import Foundation

struct CharacterService{
    
    enum CharacterServiceError: Error {
        case failed
        case failedToDecode
        case invalidStatusCode
    }


        
        func fetchCharacters() async throws -> [Character] {
            
            let url = URL(string: "https://rickandmortyapi.com/api/character")!
            
            //This await keyword ensures that we do not continue  until  we get that url. So it waits for that functionality.
            //The try block allows to handle errors.
            let(data, response) = try await URLSession.shared.data(from: url)
           
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                throw CharacterServiceError.invalidStatusCode
            }
            
            let decodedData = try JSONDecoder().decode(CharacterServiceResult.self, from: data)
            return decodedData.results
        }
        


    
}

