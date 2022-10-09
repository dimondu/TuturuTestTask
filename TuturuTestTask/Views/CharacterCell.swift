//
//  CharacterCell.swift
//  TuturuTestTask
//
//  Created by Дмитрий Дуров on 28.09.2022.
//

import UIKit

final class CharacterCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var characterImage: UIImageView! {
        didSet {
            characterImage.layer.cornerRadius = characterImage.frame.height / 2
        }
    }
    @IBOutlet weak var characterNameLabel: UILabel!
    
    // MARK: - Private properties
    
    private var activityIndicator: UIActivityIndicatorView?
    
    //MARK: - Override methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        activityIndicator = ActivityIndicator.showSpinner(in: characterImage)
    }
    
    // MARK: - Public methods
    
    func configure(with data: DataCharacter) {
        characterNameLabel.font = UIFont(name: "DisneyPark", size: 32)
        characterNameLabel.text = data.name
        
        getImage(from: data.imageUrl) { [weak self] result in
            switch result {
            case .success(let image):
                self?.characterImage.image = image
                self?.activityIndicator?.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Private methods
    
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
