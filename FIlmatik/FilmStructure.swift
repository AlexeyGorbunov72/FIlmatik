//
//  FilmStructure.swift
//  FIlmatik
//
//  Created by Alexey on 04.07.2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import Foundation
import UIKit
class Film {
    var image: UIImage?
    var name: String?
    var tagline: String?
    var filmStuff: StuffFilm?
    init(image: UIImage, name: String, tagline: String, filmStuff: StuffFilm) {
        self.image = image
        self.name = name
        self.tagline = tagline
        self.filmStuff = filmStuff
    }
}
class StuffFilm{
    var director: String?
    var operatorFilm: String?
    var actors: [Actor]?
    var rates: Float?
    init(director: String, operatorFilm: String, actors: [Actor], rates: Float) {
        self.director = director
        self.operatorFilm =  operatorFilm
        self.actors = actors
    }
}
class Actor{
    var name: String?
    var dateBorn: String?
    init(name: String) {
        self.name = name
    }
}
