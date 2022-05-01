//
//  PhotosService.swift
//  RestApp
//
//  Created by Rodrigo Dumont on 30/04/22.
//

import Foundation

class PhotosService: BaseService<Photo> {
    init() {
        super.init(path: "photos")
    }
}
