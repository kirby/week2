//
//  ViewController.swift
//  Stackoverflow
//
//  Created by Kirby Shabaga on 7/28/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var networkController = NetworkController()
    var stackoverflow = Stackoverflow()
                            
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func searchButton(sender: AnyObject) {
        println("searching for \(textField.text)")
        resultsView.text = "Searching..."
        var data: () = networkController.searchInTitle("\(textField.text)", view: resultsView)
    }

}

