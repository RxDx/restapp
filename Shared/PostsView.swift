//
//  PostsView.swift
//  RestApp
//
//  Created by Rodrigo Dumont on 30/04/22.
//

import SwiftUI

private class PostsViewModel: ObservableObject {
    private let service = PostsService()
    @Published private(set) var posts = [Post]()
    
    func getPosts() async {
        do {
            let posts = try await service.get()
            await MainActor.run {
                self.posts = posts
            }
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}

struct PostsView: View {
    
    @ObservedObject private var viewModel = PostsViewModel()
    
    var body: some View {
        List(viewModel.posts, id: \.id) { post in
            NavigationLink {
                PostView(postId: post.id)
            } label: {
                Text(post.title)
            }
        }
        .navigationTitle("Posts")
        .task {
            await viewModel.getPosts()
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
