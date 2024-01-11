//
//  ViewController.swift
//  Counter
//
//  Created by Владислав Усачев on 11.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var buttonTap: UIButton!
    public var count: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLabel.text = "\(count)"
    }

    @IBAction func buttonTapped(_ sender: Any) {
        count += 1
        counterLabel.text = "\(count)"
    }
    
}

