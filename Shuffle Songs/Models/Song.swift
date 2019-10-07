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

struct Song: Codable {
    let id: Int
    let artistID: Int?
    let artistName: String?
    let trackName: String?
    let artworkURL: URL?
    let genreName: String
    
    private enum CodingKeys: String, CodingKey {
        case id, artistName, trackName
        case artistID = "artistId"
        case artworkURL = "artworkUrl"
        case genreName = "primaryGenreName"
    }
}

struct Artist: Codable {
    let id: Int
    let artistName: String
    let artistType: String
    let primaryGenreName: String
}


struct Content: Codable {
    let artist: Artist?
    let song: Song?
//    let wrapperType: WrapperType
    
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let type = try container.decode(WrapperType.self, forKey: .wrapperType)
//
//        switch type {
//        case .artist:
//            try? container.decode(Song.self, forKey: .)
//            print("artista")
//        case .track:
//            print("song")
//        }
//        wrapperType = type
//    }
}


    

    //
    
    //{
    //    "artistName": "Charlie and the Chewie Humans",
    //    "id": 1171421960,
    //    "wrapperType": "artist",
    //    "artistType": "Artist",
    //    "primaryGenreName": "Metal"
    //}
    
    //
    
    //{
    //    "trackTimeMillis": 207679,
    //    "collectionName": "Epithet",
    //    "artistName": "Charlie and the Chewie Humans",
    //    "wrapperType": "track",
    //    "id": 579273550,
    //    "trackExplicitness": "explicit",
    //    "trackCensoredName": "Bomb Secrets",
    //    "collectionId": 879273553,
    //    "trackName": "Bomb Secrets",
    //    "country": "USA",
    //    "primaryGenreName": "Metal",
    //    "artworkUrl": "https://firebasestorage.googleapis.com/v0/b/tw-exercicio-mobile.appspot.com/o/albums%2Fcharlie-and-the-chewy-humans-epithet.png?alt=media&token=6a1baa1d-dfe1-4cb4-8042-b11de7b26dce",
    //    "releaseDate": "2010-07-01T08:00:00Z",
    //    "artistId": 1171421960
    //}

