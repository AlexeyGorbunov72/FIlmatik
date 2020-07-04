//
//  AnimatedTabBarController.swift
//  FIlmatik
//
//  Created by Alexey on 04.07.2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit

class AnimatedTabBarController: UITabBarController {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {

        let orderedTabBarItemViews: [UIView] = {
            let interactionViews = tabBar.subviews.filter({ $0 is UIControl })
            return interactionViews.sorted(by: { $0.frame.minX < $1.frame.minX })
        }()

        guard
            let index = tabBar.items?.firstIndex(of: item),
            let subview = orderedTabBarItemViews[index].subviews.first
        else {
            return
        }

        performSpringAnimation(for: subview)
    }

    func performSpringAnimation(for view: UIView) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            view.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }, completion: nil)
    }

}


