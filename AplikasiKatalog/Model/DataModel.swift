//
//  DataModel.swift
//  AplikasiKatalog
//
//  Created by Gilang Ramdhani Putra on 12/09/21.
//

import Foundation

struct GameData: Decodable {
    let game : [Game]
    
    private enum CodingKeys : String, CodingKey {
        case game = "results"
    }
}


struct Game : Decodable {
    let name : String?
    let released : String?
    let rating : Double?
    let background_image : String?
    let genres : [Genre]
    
    private enum CodingKeys: String, CodingKey {
        case name, released, rating, background_image, genres
    }
    
}

struct Genre : Decodable {
    let name : String
    
    private enum CodingKeys : String, CodingKey {
        case name
    }
    
    
}
