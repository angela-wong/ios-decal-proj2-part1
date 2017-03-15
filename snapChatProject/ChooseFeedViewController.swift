//
//  ChooseFeedViewController.swift
//  snapChatProject
//
//  Created by Angela Wong on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ChooseFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var chosenFeedName: UILabel!
    @IBOutlet weak var chooseFeedTableView: UITableView!
    @IBOutlet weak var sendPicture: UIButton!
    var chosenPic : UIImage?
    var newSnap : Snap?
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseFeedTableView.delegate = self
        chooseFeedTableView.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    @IBAction func didSend(_ sender: UIButton) {
        let alert = UIAlertController(title: "Image sent!", message: "Send another pic!", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
            (_)in
            self.performSegue(withIdentifier: "unwindToImageFeed", sender: self)
        })
        
        alert.addAction(OKAction)
        self.present(alert, animated: true)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as! categoryCellElements
        cell.feedName.text = threadNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        if let cell = chooseFeedTableView.cellForRow(at: indexPath as IndexPath) {
            cell.backgroundColor = UIColor.gray
        }
    }
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        if let cell = chooseFeedTableView.cellForRow(at: indexPath as IndexPath) {
            cell.backgroundColor = UIColor.white
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenFeedName.text = threadNames[indexPath.row]
        newSnap = Snap(username: "Angela Wong", feed: threadNames[indexPath.row], pic: chosenPic!)
            threads[newSnap!.feed]?.append(newSnap!)
    }
    
    
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? ImageFeedViewController {
            dest.newSnap = newSnap
        }
    }

}
