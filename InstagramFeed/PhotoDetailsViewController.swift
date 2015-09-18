//
//  PhotoDetailsViewController.swift
//  InstagramFeed
//
//  Created by admin on 9/17/15.
//  Copyright © 2015 mattmo. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var imageURL : String?
    
    @IBOutlet weak var photoDetailsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.photoDetailsTableView.delegate = self;
        self.photoDetailsTableView.dataSource = self;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 320;
        } else {
            return tableView.rowHeight;
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("photoDetailsCell")
        
        if indexPath.row == 0 {
            if let imageURL = self.imageURL {
                cell!.imageView?.contentMode = .ScaleAspectFit;
                cell!.imageView?.setImageWithURL(NSURL(string: imageURL)!);
            }
        }
        return cell!;
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
