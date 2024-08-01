//
//  HeroesInteractor.swift
//  AppleCodingApp
//
//  Created by Uri on 30/7/24.
//

import Foundation

protocol HeroesInteractor {
    func getHeroes() throws -> [Heroe]
    func loadJSON<JSON: Codable>(url: URL, type: JSON.Type) throws -> JSON
}

// default implementation
extension HeroesInteractor {
    
    func loadJSON<JSON: Codable>(url: URL, type: JSON.Type) throws -> JSON {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(type, from: data)
    }
}

struct HeroesLoader: HeroesInteractor {
    func getHeroes() throws -> [Heroe] {
        guard let url = Bundle.main.url(forResource: "SuperHeroes", withExtension: "json") else {
            throw URLError(.badURL)
        }
        
        return try loadJSON(url: url, type: [Heroe].self)
    }
}

// used in HomeView preview
struct HeroesLoaderTest: HeroesInteractor {
    func getHeroes() throws -> [Heroe] {
        guard let url = Bundle.main.url(forResource: "SuperHeroes", withExtension: "json") else {
            throw URLError(.badURL)
        }
        
        return try loadJSON(url: url, type: [Heroe].self).suffix(2)
    }
}
