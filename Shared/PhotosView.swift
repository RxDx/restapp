//
//  PhotosView.swift
//  RestApp
//
//  Created by Rodrigo Dumont on 30/04/22.
//

import SwiftUI

private class PhotosViewModel: ObservableObject {
    private let service = PhotosService()
    @Published private(set) var photos = [Photo]()
    
    func getPhotos() async {
        do {
            let photos = try await service.get()
            await MainActor.run {
                self.photos = photos
            }
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}

struct PhotosView: View {
    
    @ObservedObject private var viewModel = PhotosViewModel()

    var body: some View {
        List(viewModel.photos, id: \.id) { photo in
            VStack() {
                Text(photo.title).frame(
                    maxWidth: .infinity,
                    alignment: .center
                  )
                AsyncImage(url: URL(string: photo.thumbnailUrl))
            }
        }
        .navigationTitle("Photos")
        .task {
            await viewModel.getPhotos()
        }
    }
}

struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView()
    }
}
