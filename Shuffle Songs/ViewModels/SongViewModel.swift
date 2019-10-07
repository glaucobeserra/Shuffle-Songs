//
//  SongViewModel.swift
//  Shuffle Songs
//
//  Created by Glauco Dantas Beserra on 07/10/19.
//  Copyright © 2019 Glauco Dantas Beserra. All rights reserved.
//

import UIKit

class SongViewModel {
    var artworkURL: URL?
    var trackName: String
    var info: String
    
    init(song: Song) {
        artworkURL = song.artworkURL
        trackName = song.trackName ?? "unavailable track name"
        let artistName = song.artistName ?? "unavailable artist name"
        let genre = "(" + song.genreName + ")"
        info = artistName + " " + genre
    }
}
