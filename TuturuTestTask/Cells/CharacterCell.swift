//
//  CharacterCell.swift
//  TuturuTestTask
//
//  Created by Дмитрий Дуров on 28.09.2022.
//

import UIKit

final class CharacterCell: UITableViewCell {
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    
    
    func configure(with data: DataCharacter) {
        characterNameLabel.font = UIFont(name: "DisneyPark", size: 32)
        characterNameLabel.text = data.name
        characterImage.layer.cornerRadius = 20
        
        getImage(from: data.imageUrl) { [weak self] result in
            switch result {
            case .success(let image):
                self?.characterImage.image = image
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getImage(from url: String, completion: @escaping(Result<UIImage, Error>) -> Void) {
        if let cachedImage = ImageCacheManager.shared.object(forKey: url as NSString) {
            
            completion(.success(cachedImage))
            return
        }
        
        NetworkManager.shared.fetchImage(from: url) { result in
            switch result {
            case .success(let imageData):
                guard let uiImage = UIImage(data: imageData) else { return }
                ImageCacheManager.shared.setObject(uiImage, forKey: url as NSString)
                completion(.success(uiImage))
               
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
