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
    
    // MARK: - Public properties
    
    var character: DataCharacter!
    
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
        nameLabel.text = character.name
        
        
        filmsLabel.text = character.films.isEmpty
        ? "No films" : "Films \(character.films.joined(separator: ", "))"
        
    }
}

// MARK: - Networking

extension DetailViewController {
    func fetchImage() {
        NetworkManager.shared.fetchImage(from: character.imageUrl) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.characterImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
//        """
//            Фильмы: \(character.films.joined(separator: ", "))
//            Короткометражные фильмы: \(character.shortFilms.joined(separator: ", "))
//            ТВ шоу: \(character.tvShows.joined(separator: ", "))
//            Видеоигры: \(character.videoGames.joined(separator: ", "))
//            Парки аттракционов: \(character.parkAttractions.joined(separator: ", "))
//            """
