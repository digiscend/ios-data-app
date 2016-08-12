//
//  MasterViewController.swift
//  App
//
//  Created by Vikas Yadav on 05/08/16.
//  Copyright (c) 2016 Digiscend. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var projects:[Project] = []
    var filters:[BrowseFilter] = []
    var extraBrowseType: ExtraHolder! {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    /**
     * Has to prepare the tableview with either project list or filter list depending on the extraBrowseType
     */
    func configureView() {
        // Update the user interface for the detail item.
        if let baseType = self.extraBrowseType?.baseType
        {
            switch(baseType)
            {
                case Constants.baseView_PROJECTS:
                    self.projects = Project.loadlistByFilters("", filters2: "", versionCode: 3)
                default:
                    //if let filterInfoStrings:[String]  = (self.extraBrowseType?.getFilterInfoStrings ())
                    //{
                        self.filters = BrowseFilter.loadlistByFilters (self.extraBrowseType)
                    //}
            }
        }

    }

    override func awakeFromNib() {
        super.awakeFromNib()
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            self.clearsSelectionOnViewWillAppear = false
            self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.navigationItem.leftBarButtonItem = self.editButtonItem()

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
            //self.detailViewController = controllers[controllers.count-1].topViewController as? DetailViewController
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                if self.extraBrowseType.baseType == Constants.baseView_PROJECTS
                {
                    //then we prepare detail view for project detail page
                    let pobj = self.projects[indexPath.row]
                    let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                    controller.detailItem = pobj
                    controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                    controller.navigationItem.leftItemsSupplementBackButton = true
                }
                else
                {
                    //otherwise we prepare the table view again
                    //with projects in the list
                    
                    //BrowserFilter val= (BrowserFilter) parent.getAdapter().getItem(position);
                    let fobj = self.filters[indexPath.row]
                    //ExtraHolder browsetype_for_mines = browsetype.clone ();
                    let controller = (segue.destinationViewController as! UINavigationController).topViewController as! MasterViewController
                    if let browsetype_for_mines:ExtraHolder = self.extraBrowseType?.copy() as? ExtraHolder
                    {
                        browsetype_for_mines.addFilter(fobj);
                        controller.extraBrowseType = browsetype_for_mines
                    }
                    //intent.putExtra(BrowseActivity.EXTRA_PLBROWSETYPE, browsetype_for_mines);
                    controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                    controller.navigationItem.leftItemsSupplementBackButton = true
                    //startActivity(intent);
                }
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.projects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        let project = projects[indexPath.row]
        cell.textLabel?.text = project.name + ", " + project.country
        
        if let comp = project.company as Company? {
            
            cell.detailTextLabel?.text = comp.name
        }
        
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        /*if editingStyle == .Delete {
            TaskStore.sharedInstance.remove(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }*/
    }


}

