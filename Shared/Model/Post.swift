//
//  Post.swift
//  RestApp
//
//  Created by Rodrigo Dumont on 30/04/22.
//

import Foundation

struct Post: Codable, Hashable, Identifiable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
