//
//  FilmCell.swift
//  FIlmatik
//
//  Created by Alexey on 04.07.2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import Foundation
import UIKit

class FilmCell: UICollectionViewCell {
    
    var data: Film? {
        didSet {
            guard let data = data else { return }
            bg.image = data.image
            name.text = data.name
            
        }
    }
    
    fileprivate let bg: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
                iv.layer.cornerRadius = 12
        return iv
    }()
    fileprivate let rate: UILabel = {
        let label = UILabel()
        return label
    }()
    fileprivate let name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(30)
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: .zero)
        


        
        contentView.addSubview(bg)
        contentView.addSubview(name)
        name.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        name.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        
       
       
        bg.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 30).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
       
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

