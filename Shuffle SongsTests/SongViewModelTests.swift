//
//  SongViewModelTests.swift
//  Shuffle SongsTests
//
//  Created by Glauco Dantas Beserra on 07/10/19.
//  Copyright © 2019 Glauco Dantas Beserra. All rights reserved.
//

import XCTest
@testable import Shuffle_Songs

class SongViewModelTests: XCTestCase {

    var song: Song!
    
    override func setUp() {
        super.setUp()
        song = Song(id: 123, artistID: 456, artistName: "Banda Colapso", trackName: "O sol me traiu", artworkURL: nil, genreName: "Metal", wrapperType: .track)
    }

    override func tearDown() {
        super.tearDown()
        song = nil
    }

    
    func testAttributes() {
        let songViewModel = SongViewModel(song: song)
        
        // Attributes should not be nil
        XCTAssertNotNil(songViewModel.trackName, "track name is nil in SongViewModel")
        XCTAssertNotNil(songViewModel.info, "info (artist + genre) is nil in SongViewModel")
        
        // Test if the attributes have the same desired value as they should have.
        XCTAssertEqual(song.trackName, songViewModel.trackName)
        let desiredInfoText = "\(song.artistName!) (\(song.genreName))"
        XCTAssertEqual(desiredInfoText, songViewModel.info)
        
    }
}
