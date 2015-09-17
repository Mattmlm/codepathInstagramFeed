//
//  PhotosViewController.swift
//  InstagramFeed
//
//  Created by admin on 9/16/15.
//  Copyright © 2015 mattmo. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var photos : NSArray?
    @IBOutlet weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView!.delegate = self;
        self.tableView!.dataSource = self;
        
        self.tableView!.rowHeight = 320;
        // Do any additional setup after loading the view.
        let clientId = "a7f8e5547c7d4c8fa88cfffbd53ae6a7"
        
        let url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=\(clientId)")!
        let request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            print (response)
            if let d = data {
                let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(d, options: [])
                print (responseDictionary)
                self.photos = responseDictionary["data"] as! NSArray
                self.tableView!.reloadData()
            } else {
                if let e = error {
                    NSLog("Error: \(e)")
                }
            }
        }
//        NSURLConnection.sendAsynchronousRequest(request: request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
//            var responseDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
//            self.photos = responseDictionary["data"] as! NSArray
//            self.tableView.reloadData()
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if ((self.photos) != nil) {
            return self.photos!.count;
        } else {
            return 0
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = PhotosTableViewCell()
        cell
        return cell
    }

}
