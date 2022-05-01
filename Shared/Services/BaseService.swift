//
//  BaseService.swift
//  RestApp
//
//  Created by Rodrigo Dumont on 30/04/22.
//

import Foundation
import RestApi

class BaseService<T: Codable>: RestApi<T> {
    init(path: String) {
        super.init(baseUrl: "https://jsonplaceholder.typicode.com", path: path)
    }
}
