//
//  ContentView.swift
//  H4X3R N3ws
//
//  Created by Marcel Mravec on 20.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(networkManager.array, id: \.self) { post in
                    HStack {
                        Text(post.description)
                        
                    }
                }
            }
            .navigationBarTitle("H4X3R N3ws")
        }
        .onAppear {
            networkManager.fetchData()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


