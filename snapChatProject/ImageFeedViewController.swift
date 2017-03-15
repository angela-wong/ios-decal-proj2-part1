//
//  ImageFeedViewController.swift
//  snapChatProject
//
//  Created by Angela Wong on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ImageFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func unwindImageFeed(segue:UIStoryboardSegue) {
        
    }
    @IBOutlet var imageFeedTableView: UITableView!
    var newSnap : Snap?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageFeedTableView.delegate = self
        imageFeedTableView.dataSource = self
        
    }

    override func viewWillAppear(_ animated: Bool) {
        imageFeedTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let feedName = threadNames[section]
        return threads[feedName]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageFeedCell", for: indexPath) as! ImageFeedCell
        if let snap = getSnap(indexPath: indexPath) {
            if snap.read {
                cell.imageStatus.image = UIImage(named: "read")
            }
            else {
                cell.imageStatus.image = UIImage(named: "unread")
            }
            cell.name.text = snap.username
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let snap = getSnap(indexPath: indexPath), !snap.read {
            snap.read = true
            newSnap = snap
            performSegue(withIdentifier: "viewSnap", sender: self)
        }
        
    }

 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "viewSnap" {
                if let dest = segue.destination as? viewSnapImageController {
                    dest.snapToRead = newSnap
                }
            }
        }
    }

}
