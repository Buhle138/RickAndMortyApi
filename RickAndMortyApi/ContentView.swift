//
//  ContentView.swift
//  RickAndMortyApi
//
//  Created by Buhle Radzilani on 2024/06/18.
//

import SwiftUI

struct ContentView: View {
     
    @StateObject private var vm = CharacterViewModel(service: CharacterService())
    
    
    var body: some View {
        NavigationView{
            switch vm.state {
            case.success(let data):
                List{
                    ForEach(data, id: \.id) {item in
                       
                        Text(item.name)
                        
                    }
                }
                .navigationTitle("Characters")
            case .loading:
                ProgressView()
            default:
                EmptyView()
            }
        }
        .task {
           await vm.getCharacters()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
