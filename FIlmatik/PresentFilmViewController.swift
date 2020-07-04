//
//  PresentFilmViewController.swift
//  FIlmatik
//
//  Created by Alexey on 04.07.2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit

class PresentFilmViewController: UIViewController {
    @IBOutlet weak var tagline: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var poster: UIImageView!
    var film_: Film?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let film = film_{
            tagline.text = film.tagline ?? "undefined"
            name.text = film.name ?? "undefined"
            poster.image = film.image ?? UIImage(imageLiteralResourceName: "heart")
            poster.layer.cornerRadius = 20
        }
       
    }
    

   

}
