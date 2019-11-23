//
//  ViewController.swift
//  digipro_JosePablo
//
//  Created by Jose Pablo Perez Estrada on 11/22/19.
//  Copyright © 2019 Jose Pablo Perez Estrada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor.green.cgColor, UIColor.blue.cgColor]
        layer.startPoint = CGPoint(x: 0,y: 0)
        layer.endPoint = CGPoint(x: 1,y: 1)
        view.layer.addSublayer(layer)
        
        let image = UIImage(named: "digipro.png")
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: (screenWidth/2)-150, y: (screenHeight/2)-100, width: 300, height: 200)
        view.addSubview(imageView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {  self.performSegue(withIdentifier: "toForm", sender: nil)
        }
    }
}

