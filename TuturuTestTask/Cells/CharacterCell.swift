//
//  CharacterCell.swift
//  TuturuTestTask
//
//  Created by Дмитрий Дуров on 28.09.2022.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    @IBOutlet weak var characterImage: UIImageView!
    
    @IBOutlet weak var characterNameLabel: UILabel!
    
    
    func configure(with data: Data) {
        characterNameLabel.text = data.name
    }
}
