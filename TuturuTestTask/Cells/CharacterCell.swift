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
        
        NetworkManager.shared.fetchImage(from: data.imageUrl) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.characterImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
