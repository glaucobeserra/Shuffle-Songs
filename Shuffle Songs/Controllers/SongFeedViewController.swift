//
//  ViewController.swift
//  Shuffle Songs
//
//  Created by Glauco Dantas Beserra on 06/10/19.
//  Copyright © 2019 Glauco Dantas Beserra. All rights reserved.
//

import UIKit

class SongFeedViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Properties
    private let artists: [Artists] = [.BlocoTotiOQue, .CharlieAndTheChewieHumans, .DecimaisMCs, .JohnDollar, .MCArianne]
    
    private lazy var viewModel: SongFeedViewModel = {
        return SongFeedViewModel(artists: self.artists)
    }()
    
    private lazy var refresher: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .lightGray
        refreshControl.addTarget(self, action: #selector(reloadSongs), for: .valueChanged)
        return refreshControl
    }()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfig()
        setupViewModel()
    }
    
    // MARK: Actions
    @IBAction func shuffleSongs(_ sender: UIBarButtonItem) {
        
    }
}

// MARK: - Extension UITableViewDataSource

extension SongFeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SongTableViewCell") as? SongTableViewCell else {return UITableViewCell()}
        let songModel = viewModel.dataModelAt(indexPath: indexPath)
        cell.configCell(with: songModel)
        return cell
    }
}

// MARK: - Auxiliary methods

extension SongFeedViewController {
    
    private func tableViewConfig() {
        tableView.tableFooterView = UIView()
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refresher
        }
        tableView.register(UINib(nibName: "SongTableViewCell", bundle: nil), forCellReuseIdentifier: "SongTableViewCell")
        
    }
    
    private func setupViewModel() {
        viewModel.onInformationLoaded = { [weak self] in
            DispatchQueue.main.async {
                self?.loadingControl(activityIndicatorEnable: false)
                self?.tableView.reloadData()
            }
        }
        
        viewModel.onInformationFailed = { [weak self] error in
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            self?.showAlert(with: "Error", message: error, action: action)
            self?.loadingControl(activityIndicatorEnable: false)
            return
        }
        
        reloadSongs()
    }
    
    @objc private func reloadSongs() {
        viewModel.getSongs()
    }
    
    private func loadingControl(activityIndicatorEnable: Bool?) {
        DispatchQueue.main.async {
            if self.refresher.isRefreshing {
                self.refresher.endRefreshing()
                return
            }
            
            guard let isActivated = activityIndicatorEnable else { return }
            
            self.activityIndicator.isHidden = !isActivated
            
            // Adicionando um pouco de vida a transição de exibição da tableView ✨
            UIView.transition(with: self.tableView,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: { self.tableView.isHidden = isActivated },
                              completion: nil)
            
            if isActivated {
                self.activityIndicator.startAnimating()
            } else {
                self.activityIndicator.stopAnimating()
            }
        }
    }
}
