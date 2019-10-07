//
//  ViewController.swift
//  Shuffle Songs
//
//  Created by Glauco Dantas Beserra on 06/10/19.
//  Copyright © 2019 Glauco Dantas Beserra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    private let sessionProvider = URLSessionProvider()
    var finalSongList = [Song]()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getSongs(from: [.BlocoTotiOQue, .CharlieAndTheChewieHumans, .DecimaisMCs, .JohnDollar, .MCArianne])
        tableView.register(UINib(nibName: "SongTableViewCell", bundle: nil), forCellReuseIdentifier: "SongTableViewCell")
        tableView.tableFooterView = UIView()
    }
    
    private func getSongs(from artists: [Artists]) {
        let service = SongsService.getSongs(from: artists)
        sessionProvider.request(request: service, type: SongResult.self) { result in
            switch result {
            case .success(let result):
                let songs = result.results
                var songList = [Song]()
                print(songList.count)
                for song in songs {
                    if song.trackName != nil {
                        songList.append(song)
                    }
                    
                }
                print(songList.count)
                self.finalSongList = songList
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.tableView.isHidden = false
                    self.activityIndicator.isHidden = true
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - Extension UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finalSongList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SongTableViewCell") as? SongTableViewCell else {return UITableViewCell()}
        let row = indexPath.row
        let track = finalSongList[row].trackName ?? "erro"
        cell.trackNameLabel.text = track
//        cell.config(trackName: track)
        
            
//
//
//        cell.trackNameLabel.text =
        
        return cell
    }
    
    
}
