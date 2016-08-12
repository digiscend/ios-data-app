//
//  HomeViewController.swift
//  App
//
//  Created by Vikas Yadav on 09/08/16.
//  Copyright (c) 2016 Digiscend. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = (segue.destinationViewController as! UINavigationController).topViewController as! MasterViewController
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        switch(segue.identifier)
        {
        case Constants.ID_BUTTON_COUNTRIES?:
            controller.extraBrowseType = ExtraHolder(baseTypeP: Constants.baseView_COUNTRY)
        case Constants.ID_BUTTON_MINERALS?:
            controller.extraBrowseType = ExtraHolder(baseTypeP:Constants.baseView_MINERAL)
        case Constants.ID_BUTTON_STAGES?:
            controller.extraBrowseType = ExtraHolder(baseTypeP:Constants.baseView_STAGE)
        default:
            controller.extraBrowseType = ExtraHolder(baseTypeP:Constants.baseView_PROJECTS)
        }

        controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
        controller.navigationItem.leftItemsSupplementBackButton = true
    }


}
