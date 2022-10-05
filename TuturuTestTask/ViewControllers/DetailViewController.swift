//
//  DetailViewController.swift
//  TuturuTestTask
//
//  Created by Дмитрий Дуров on 30.09.2022.
//

import UIKit

final class DetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var characterImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var filmsLabel: UILabel!
    @IBOutlet weak var videoGamesLabel: UILabel!
    @IBOutlet weak var tvShowsLabel: UILabel!
    
    // MARK: - Public properties
    
    var character: DataCharacter!
    
    // MARK: - Private properties
    
    private var activityIndicator: UIActivityIndicatorView?
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterImage.layer.cornerRadius = 20
        activityIndicator = ActivityIndicator.showSpinner(in: characterImage)
        fetchImage()
        setLabels()
    }
    
    //MARK: - Private methods
    
    private func setLabels() {
        nameLabel.text = character.name
        filmsLabel.text = character.films.isEmpty
        ? "С этим персонажем нет фильмов" : "Фильмы: \(character.films.joined(separator: ", "))"
        
        videoGamesLabel.text = character.videoGames.isEmpty
        ? "С этим персонажем нет видео игр" : "Видео игры: \(character.videoGames.joined(separator: ", "))"
        
        tvShowsLabel.text = character.tvShows.isEmpty
        ? "С этим персонажем нет ТВ шоу" : "ТВ шоу: \(character.tvShows.joined(separator: ", "))"
    }
}

// MARK: - Networking

extension DetailViewController {
    func fetchImage() {
        NetworkManager.shared.fetchImage(from: character.imageUrl) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.characterImage.image = UIImage(data: imageData)
                self?.activityIndicator?.stopAnimating()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
