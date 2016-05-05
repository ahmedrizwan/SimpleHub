//
//  ViewController.swift
//  SimpleHub
//
//  Created by Ahmed Rizwan on 04/05/2016.
//  Copyright © 2016 Ahmed Rizwan. All rights reserved.
//

import UIKit
import Alamofire
import Freddy


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
    
    func textViewDidBeginEditing(textView: UITextView) {
        if textView.textColor == UIColor.lightGrayColor() {
            textView.text = nil
            textView.textColor = UIColor.blackColor()
        }
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
    

    @IBAction func searchForUser(sender: AnyObject) {
        
        let urlPath: String = "https://api.github.com/users/\(editTextUserName.text!)"
        
        Alamofire.request(.GET, urlPath)
            .responseJSON { response in switch response.result {
            case .Success(let JSON):
                print("Success with JSON: \(JSON)")
                
                let response = JSON as! NSDictionary
                let imageUrl = response.objectForKey("avatar_url")! as! String
                
                self.imageViewUser.hidden = false
                self.imageViewUser.downloadedFrom(link: imageUrl, contentMode: .ScaleAspectFit)
                
                self.labelUserName.hidden = false
                self.labelUserName.text = response.objectForKey("name") as? String
                
                self.labelTotalRepos.hidden = false
                print(response.objectForKey("public_repos")!.stringValue)
                self.labelTotalRepos.text = "Total Repositories : \(response.objectForKey("public_repos")!.stringValue)"
                
            case .Failure(let error):
                print("Request failed with error: \(error)")
                }
        }
        
        
    }
    
  

}

