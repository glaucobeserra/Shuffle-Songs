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
    let artists: [Artists] = [.BlocoTotiOQue, .CharlieAndTheChewieHumans, .DecimaisMCs, .JohnDollar, .MCArianne]
    lazy var viewModel: SongFeedViewModel = {
        return SongFeedViewModel(artists: self.artists)
    }()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfig()
        setupViewModel()
    }
    
    private func setupViewModel() {
        viewModel.onInformationLoaded = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.tableView.isHidden = false
                self?.activityIndicator.isHidden = true
            }
        }
        
        viewModel.getSongs()
    }
    
    private func tableViewConfig() {
        tableView.register(UINib(nibName: "SongTableViewCell", bundle: nil), forCellReuseIdentifier: "SongTableViewCell")
        tableView.tableFooterView = UIView()
    }
}

// MARK: - Extension UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SongTableViewCell") as? SongTableViewCell else {return UITableViewCell()}
        let row = indexPath.row
        let track = viewModel.songs[row].trackName ?? "erro"//.finalSongList[row].trackName ?? "erro"
        cell.trackNameLabel.text = track
//        cell.config(trackName: track)
        
            
//
//
//        cell.trackNameLabel.text =
        
        return cell
    }
    
    
}
