//
//  DetailViewController.swift
//  App
//
//  Created by Vikas Yadav on 05/08/16.
//  Copyright (c) 2016 Digiscend. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var introView: UITextView!

    var detailItem: Project? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail: Project = self.detailItem? {
            if let label = self.nameLabel {
                label.text = detail.name
            }
            if let notes = self.introView {
                notes.text = detail.intro
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

