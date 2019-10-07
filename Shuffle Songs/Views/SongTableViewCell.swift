//
//  SongTableViewCell.swift
//  Shuffle Songs
//
//  Created by Glauco Dantas Beserra on 07/10/19.
//  Copyright © 2019 Glauco Dantas Beserra. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet private weak var artworkImageView: UIImageView!
    @IBOutlet private weak var trackNameLabel: UILabel!
    @IBOutlet private weak var infoLabel: UILabel!
    
    // MARK: Public methods
    func configCell(with model: SongViewModel) {
        trackNameLabel.text = model.trackName
        infoLabel.text = model.info
        artworkImageView.image = UIImage(named: "placeholderCover")
        if let artworkURL = model.artworkURL {
            artworkImageView.loadImageUsingUrl(url: artworkURL)
        }
    }
}
