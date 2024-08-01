//
//  Heroe.swift
//  AppleCodingApp
//
//  Created by Uri on 30/7/24.
//

import Foundation

struct Heroe: Codable, Identifiable {
    let id: String
    let nombreReal: String
    let edad: Int
    let imagen: String
}
