//
//  ViewController.swift
//  RickAndMortyBook
//
//  Created by abdullah's Ventura on 28.04.2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var characters = [RickAndMorty]()
    
    var chosenCharacters : RickAndMorty?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        let rick = RickAndMorty(name: "Rick Sanchez", image: UIImage(named: "rick")!,
                                description: "Alkolizmi ve pervasız, nihilist davranışları kızının ailesi ve oğulları Morty'nin güvenliği için endişe kaynağı olan bir megagenius bilim adamıdır. ")
        let beth = RickAndMorty(name: "Beth Smith", image: UIImage(named: "beth")!,
                                description: "Jerry Smith'in karısı Rick ve Diane Sanchez'in kızı ve Summer Smith ve ölen Morty Smith'in annesidir")
        let summer = RickAndMorty(name: "Summer Smith", image: UIImage(named: "summer")!,
                                  description: "Smith Ailesi'nin bir üyesi, Morty Smith'in ablası ve Naruto Smith'in annesi Jerry Smith ve Beth Smith/Space Beth'in kızıdır")
        let morty = RickAndMorty(name: "Morty Smith", image: UIImage(named: "morty")!,
                                 description: "Rick Sanchez'in torunu ve sık sık çeşitli talihsizliklerini takip etmek zorunda kalıyor. Morty, kız kardeşi Summer ile birlikte Harry Herpson Lisesi'ne devam ediyor.")
        
        characters.append(rick)
        characters.append(beth)
        characters.append(summer)
        characters.append(morty)
        
    }
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = characters[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }
    //verilerin detail view controllerda esitlenebilmesi icin yapilan islemler
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenCharacters = characters[indexPath.row]
        self.performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.selected = chosenCharacters
        }
    }

}

