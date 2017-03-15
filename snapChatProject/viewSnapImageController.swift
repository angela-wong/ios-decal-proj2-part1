//
//  viewSnapImageController.swift
//  snapChatProject
//
//  Created by Angela Wong on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class viewSnapImageController : UIViewController {
    var snapToRead: Snap?
    
    @IBOutlet weak var snapImage: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        snapImage.image = snapToRead?.pic
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        snapImage.image = snapToRead?.pic
        // Do any additional setup after loading the view.
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        snapImage.isUserInteractionEnabled = true
        snapImage.addGestureRecognizer(tapRecognizer)
    }
    
    func imageTapped(tapRecognizer: UITapGestureRecognizer) {
        performSegue(withIdentifier: "backtoFeed", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
