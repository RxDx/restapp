//
//  Photo.swift
//  RestApp
//
//  Created by Rodrigo Dumont on 30/04/22.
//

import Foundation

struct Photo: Codable, Hashable, Identifiable {
    let id: Int
    let albumId: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
