//
//  ContentView.swift
//  AppleCodingApp
//  1h 2m - https://www.youtube.com/live/r7rUPRmirqE?si=atjlPPpe6JbTy08p
//  Created by Uri on 30/7/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        List {
            if let error = viewModel.error {
                Text(error)
            }
            
            ForEach(viewModel.heroes) { heroe in
                Text(heroe.nombreReal)
            }
        }
    }
}

#Preview {
    HomeView()
}
