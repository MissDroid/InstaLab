//
//  ViewController.swift
//  Swiftgram
//
//  Created by Maliha Fairooz on 3/5/16.
//  Copyright © 2016 Maliha Fairooz. All rights reserved.
//

import UIKit
import AFNetworking


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var swiftData: [NSDictionary]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        let clientId = "e05c462ebd86446ea48a5af73769b602"
        let url = NSURL(string:"https://api.instagram.com/v1/media/popular?client_id=\(clientId)")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
            completionHandler: { (dataOrNil, response, error) in
                if let data = dataOrNil {
                    if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                        data, options:[]) as? NSDictionary {
                            NSLog("response: \(responseDictionary)")
                            //print(self.swiftData!["data"]![0])
                            self.swiftData = responseDictionary["data"] as? [NSDictionary]
                            self.tableView.reloadData()
                    }
                }
                
        });
        task.resume()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        tableView.rowHeight = 320
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("SwiftCell", forIndexPath: indexPath) as! TableViewCell
        cell.textLabel?.text = "row: \(indexPath.row)"
        print("row \(indexPath.row)")
      
        let sData = swiftData?[indexPath.row]
        let name = sData?["username"] as? String
        
        cell.nameLabel.text = name
        
        
        return cell
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

