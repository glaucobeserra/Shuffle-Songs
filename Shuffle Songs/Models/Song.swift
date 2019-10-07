//
//  Song.swift
//  Shuffle Songs
//
//  Created by Glauco Dantas Beserra on 06/10/19.
//  Copyright © 2019 Glauco Dantas Beserra. All rights reserved.
//

import Foundation

struct SongResult: Codable {
    let results: [Song]
}

struct Song: Codable, Hashable {
    let id: Int
    let artistID: Int?
    let artistName: String?
    let trackName: String?
    let artworkURL: URL?
    let genreName: String
    let wrapperType: WrapperType
    
    private enum CodingKeys: String, CodingKey {
        case id, artistName, trackName, wrapperType
        case artistID = "artistId"
        case artworkURL = "artworkUrl"
        case genreName = "primaryGenreName"
    }
}

// TODO: Criar estratégia para identificar quando recebe um artista ou uma track
