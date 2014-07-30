//
//  DetailViewController.swift
//  Stackoverflow
//
//  Created by Kirby Shabaga on 7/30/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var idLabel: UILabel!
    
    var question : Question?

    override func viewDidLoad() {
        super.viewDidLoad()

        if question {
            println("\(question)")
            idLabel.text = question!.title
        }
    }

}
