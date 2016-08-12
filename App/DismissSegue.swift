//
//  DismissSegue.swift
//  App
//
//  Created by Vikas Yadav on 05/08/16.
//  Copyright (c) 2016 Digiscend. All rights reserved.
//

import UIKit

@objc(DismissSegue) class DismissSegue: UIStoryboardSegue {
//class DismissSegue: UIStoryboardSegue {
    override func perform() {
        if let controller = sourceViewController.presentingViewController {
            controller.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
