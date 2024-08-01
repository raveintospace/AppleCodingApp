//
//  HomeViewModel.swift
//  AppleCodingApp
//
//  Created by Uri on 1/8/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published var heroes: [Heroe]
    @Published var error: String?
    
    init(interactor: HeroesInteractor = HeroesLoader()) {
        do {
            self.heroes = try interactor.getHeroes()
        } catch {
            debugPrint(error)
            self.heroes = []
            self.error = error.localizedDescription
        }
        
    }
    
}
