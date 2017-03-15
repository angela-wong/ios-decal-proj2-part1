//
//  CategoryViewController.swift
//  snapChatProject
//
//  Created by Angela Wong on 3/9/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    var cachedImages: [Int:UIImage] = [:]
    var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        pokemonTableView.dataSource = self
//        pokemonTableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return pokemonArray!.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        performSegue(withIdentifier: "categoryToInfo", sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell2 = pokemonTableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! cellElements
//        let pokemon: Pokemon! = pokemonArray![indexPath.row]
//        if let image = cachedImages[indexPath.row] {
//            cell2.pokepic.image = image // may need to change this!
//        } else {
//            let url = URL(string: pokemon.imageUrl)!
//            let session = URLSession(configuration: .default)
//            let downloadPicTask = session.dataTask(with: url) { (data, response, error) in
//                if let e = error {
//                    print("Error downloading picture: \(e)")
//                } else {
//                    if let _ = response as? HTTPURLResponse {
//                        if let imageData = data {
//                            let image = UIImage(data: imageData)
//                            self.cachedImages[indexPath.row] = image
//                            cell2.pokepic.image = UIImage(data: imageData) // may need to change this!
//                            
//                        } else {
//                            print("Couldn't get image: Image is nil")
//                        }
//                    } else {
//                        print("Couldn't get response code")
//                    }
//                }
//            }
//            downloadPicTask.resume()
//        }
//        cell2.name.text = pokemon.name
//        cell2.number.text = "#\(String(pokemon.number))"
//        cell2.stats.text = "\(pokemon.attack!) | \(pokemon.defense!) | \(pokemon.health!)"
//        return cell2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let identifier = segue.identifier {
//            if identifier == "categoryToInfo" {
//                if let dest = segue.destination as? PokemonInfoViewController {
//                    dest.pokemon = pokemonArray?[(selectedIndexPath?.row)!]
//                    dest.image = cachedImages[(selectedIndexPath?.row)!]
//                }
//            }
//        }
    }
    
}

