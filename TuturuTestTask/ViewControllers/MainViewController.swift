//
//  ViewController.swift
//  TuturuTestTask
//
//  Created by Дмитрий Дуров on 28.09.2022.
//

import UIKit
import RealmSwift

final class MainViewController: UITableViewController {
    
    // MARK: - Private ptoperties
    
    private var characters: Results<DataCharacter>!
    private var disneyCharacter: Character!
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
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        detailVC.character = characters[indexPath.row]
    }
}

// MARK: - Networking

extension MainViewController {
    private func fetchData() {
        NetworkManager.shared.fetchCharacter(url: Link.characterURL.rawValue) { [weak self] result in
            switch result {
            case .success(let character):
                if (((self?.characters.isEmpty)) != nil) {
                    try! realm.write {
                        characters = realm.objects(character.data)
                    }
                }  else {
                    StorageManager.saveObject(character)
                }
                self?.tableView.reloadData()
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}



