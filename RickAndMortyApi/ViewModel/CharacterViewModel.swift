//
//  CharacterViewModel.swift
//  RickAndMortyApi
//
//  Created by Buhle Radzilani on 2024/06/18.
//

import Foundation

@MainActor
class CharacterViewModel: ObservableObject {
    
    enum State {
        case na
        case loading
        case success (data: [Character])
        case failed(error: Error)
    }
    
    @Published private(set) var state: State = .na
    
    //initializing the character service object so that we can get access to the methods found in character service.
    private let service: CharacterService
    
    init(service: CharacterService) {
        self.service = service
    }
    
    
    
    func getCharacters() async{
        
        self.state = .loading
        
        do {
            let characters = try await service.fetchCharacters()
            self.state = .success(data: characters)
        }catch{
            self.state = .failed(error: error)
        }
        
    }
    
}
