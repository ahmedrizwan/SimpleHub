//
//  ViewController.swift
//  SimpleHub
//
//  Created by Ahmed Rizwan on 04/05/2016.
//  Copyright © 2016 Ahmed Rizwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var editTextUserName: UITextField!
    @IBOutlet weak var buttonSearch: UIButton!
    @IBOutlet weak var imageViewUser: UIImageView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelTotalRepos: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        imageViewUser.hidden = true
        labelTotalRepos.hidden = true
        labelUserName.hidden = true
    }


}

