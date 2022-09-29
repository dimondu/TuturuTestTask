//
//  ViewController.swift
//  TuturuTestTask
//
//  Created by Дмитрий Дуров on 28.09.2022.
//

import UIKit

final class MainViewController: UITableViewController {
    
    // MARK: - Private ptoperties
    
    private var characters: [Data] = []
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        title = "Disney Characters"
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "characterCell",
                for: indexPath
            ) as? CharacterCell
        else {
            return UITableViewCell()
        }
        
        let character = characters[indexPath.row]
        cell.configure(with: character)
        
        return cell
    }
}

// MARK: - Networking

extension MainViewController {
    private func fetchData() {
        NetworkManager.shared.fetchCharacter(url: Link.characterURL.rawValue) { result in
            switch result {
            case .success(let character):
                self.characters = character.data
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
