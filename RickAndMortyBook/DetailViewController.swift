//
//  DetailViewController.swift
//  RickAndMortyBook
//
//  Created by abdullah's Ventura on 28.04.2023.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterDescription: UILabel!
    
    var selected : RickAndMorty?
    override func viewDidLoad() {
        super.viewDidLoad()

        characterName.text = selected?.name
        characterImageView.image = selected?.image
        characterDescription.text = selected?.description
        
    }
}
