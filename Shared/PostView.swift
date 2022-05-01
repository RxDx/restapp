//
//  PostView.swift
//  RestApp
//
//  Created by Rodrigo Dumont on 01/05/22.
//

import SwiftUI

private class PostViewModel: ObservableObject {
    private let postId: Int
    private let service = PostsService()
    @Published private(set) var post: Post? = nil
    
    init(postId: Int) {
        self.postId = postId
    }
    
    func getPost() async {
        do {
            let post = try await service.get(resourceId: "\(postId)")
            await MainActor.run {
                self.post = post
            }
        } catch {
            debugPrint(error.localizedDescription)
        }
        
    }
}


struct PostView: View {
    
    @ObservedObject private var viewModel: PostViewModel
    
    init(postId: Int) {
        viewModel = PostViewModel(postId: postId)
    }
    
    var body: some View {
        VStack(
            alignment: .leading
        ) {
            if let post = viewModel.post {
                Text("Title:")
                    .font(.title3)
                    .fontWeight(.medium)
                Text(post.title)
                    .padding(.bottom, 16)
                Text("Body:")
                    .font(.title3)
                    .fontWeight(.medium)
                Text(post.body)
            } else {
                Text("Loading...")
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(16)
        .task {
            await viewModel.getPost()
        }
        .navigationTitle("Post \(viewModel.post?.id ?? 0)")
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(postId: 1)
    }
}
