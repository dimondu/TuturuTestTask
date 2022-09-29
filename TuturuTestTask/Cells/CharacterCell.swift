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
        characterNameLabel.text = data.name
        
        
        NetworkManager.shared.fetchImage(from: data.imageUrl) { [weak self] imageData in
            switch imageData {
            case .success(let image):
                self?.characterImage.image = UIImage(data: image)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
