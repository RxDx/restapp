//
//  PostsService.swift
//  RestApp
//
//  Created by Rodrigo Dumont on 30/04/22.
//

import Foundation

class PostsService: BaseService<Post> {
    init() {
        super.init(path: "posts")
    }
}
