//
//  ContentView.swift
//  AppleCodingApp
//  1h 2m - https://www.youtube.com/live/r7rUPRmirqE?si=atjlPPpe6JbTy08p
//  Created by Uri on 30/7/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        List {
            if let error = viewModel.error {
                Text(error)
            }
            
            ForEach(viewModel.heroes) { heroe in
                HeroeRowView(heroe: heroe)
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(interactor: HeroesLoaderTest()))
}

extension HomeView {
    
    struct HeroeRowView: View {
        
        let heroe: Heroe
        
        var body: some View {
            HStack {
                Image(systemName: "shield")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                Text(heroe.nombreReal)
            }
        }
    }
}
