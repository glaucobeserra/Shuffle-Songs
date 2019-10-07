//
//  SongFeedViewModel.swift
//  Shuffle Songs
//
//  Created by Glauco Dantas Beserra on 07/10/19.
//  Copyright © 2019 Glauco Dantas Beserra. All rights reserved.
//

import Foundation

class SongFeedViewModel {
    
    // MARK: Reactors
    var onInformationLoaded: (() -> Void)?
    var onInformationFailed: ((String) -> Void)?
    
    // MARK: Private properties
    private let sessionProvider = URLSessionProvider()
    private let artists: [Artists]!
    private let limit: Int
    
    // MARK: Shared properties
    var numberOfRows = 0
    private(set) var songs: [Song] = [] {
        didSet {
            numberOfRows = songs.count
            onInformationLoaded?()
        }
    }
    
    // MARK: Inicialization
    init(artists: [Artists], limit: Int = 6) {
        self.artists = artists
        self.limit = limit
    }
    
    // MARK: Methods
    
    // TODO: Melhorar a maneira como a música é distinguida do artista através do model (Decoding Strategy) ⚠️
    func getSongs() {
        let service = SongsService.getSongs(from: artists, limit: limit)
        sessionProvider.request(request: service, type: SongResult.self) { result in
            switch result {
            case .success(let result):
//                self.songs = []
                let validSongs = result.results.filter {
                    $0.trackName != nil && $0.wrapperType == .track}
                self.songs = validSongs
            case .failure(let error):
                self.onInformationFailed?(error.localizedDescription)
            }
        }
    }
    
    // FIXME: Garantir que não vão se repetir os artistas
    // Backtrace é uma alternativa? Problema da complexidade O(n!)
    func getShuffleSongs() {
        songs = songs.shuffled()
    }
    
    func dataModelAt(indexPath: IndexPath) -> SongViewModel {
        let index = indexPath.row
        let song = songs[index]
        return SongViewModel(song: song)
    }
    
}
