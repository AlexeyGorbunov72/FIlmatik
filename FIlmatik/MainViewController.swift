//
//  MainViewController.swift
//  FIlmatik
//
//  Created by Alexey on 04.07.2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit

class MainViewController: UIViewController{
    fileprivate var data = [Film]()
        fileprivate let collectionView:UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
            cv.translatesAutoresizingMaskIntoConstraints = false
            cv.register(FilmCell.self, forCellWithReuseIdentifier: "cell")
            return cv
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.collectionView.showsVerticalScrollIndicator = false
            for i in 0...100{
                var name_ = ""
                var path_ = ""
                if i % 4 == 0{
                    name_ = "Побег из Шоушенка"
                    path_ = "pic1.jpg"
                }
                else if i % 4 == 1{
                   name_ = "Мой шпион"
                    path_ = "pic2.jpg"
                }
                else if i % 4 == 2{
                    name_ = "Таксист"
                    path_ = "pic3.jpg"
                }
                else{
                    name_ = "Основатель"
                    path_ = "pic4.jpg"
                }
                print(path_)
                self.data += [Film(image: UIImage(imageLiteralResourceName: path_), name: name_, tagline: "«Страх - это кандалы. Надежда - это свобода.»", filmStuff: StuffFilm(director: "", operatorFilm: "", actors: [Actor(name: "")], rates: 4))]
            }
            title = "Фильмы"
            view.addSubview(collectionView)
            collectionView.backgroundColor = .white
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
            collectionView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
            
           
        }
    func presentFilmView(data: Film?, indexPath: IndexPath){
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "presentationFilm") as! PresentFilmViewController
        newViewController.film_ = data
        
        self.navigationController?.pushViewController(newViewController, animated: true)
        
    }

}

    extension MainViewController: UICollectionViewDelegateFlowLayout {
        private func collectionView(collectionView: UICollectionView,
            layout collectionViewLayout: UICollectionViewLayout,
            sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
        {
            
            return CGSize(width:400, height:1000)
        }
       
    }

extension MainViewController: UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
               return data.count
           }
           
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FilmCell
               cell.data = self.data[indexPath.item]
               return cell
           }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat{
               return CGFloat(50)
           }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presentFilmView(data: data[indexPath.row], indexPath: indexPath)

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return data[indexPath.row].image?.size ?? CGSize(width: 300, height: 300)
        return CGSize(width: view.frame.width/(1.5), height: view.frame.height/(2))
    }
    
}

