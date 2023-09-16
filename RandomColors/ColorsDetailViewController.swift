//
//  ColorsDetailViewController.swift
//  RandomColors
//
//  Created by Gerson Fuchs on 16/09/23.
//

import UIKit

class ColorsDetailViewController: UIViewController {
    
    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = color ?? .blue
    }
}
