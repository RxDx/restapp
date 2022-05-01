//
//  MainView.swift
//  Shared
//
//  Created by Rodrigo Dumont on 30/04/22.
//

import SwiftUI

struct MainView: View {
    
    let resources = [
        "posts",
        "comments",
        "albums",
        "photos",
        "todos",
        "users"
    ]
        
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    PostsView()
                } label: {
                    Text("Posts")
                }
                NavigationLink {
                    PhotosView()
                } label: {
                    Text("Photos")
                }
            }
            .navigationTitle("Resources")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
