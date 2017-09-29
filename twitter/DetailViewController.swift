//
//  DetailViewController.swift
//  twitter
//
//  Created by Rajat Bhargava on 9/29/17.
//  Copyright © 2017 Rajat Bhargava. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screennameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var retweetInfo: UILabel!
    @IBOutlet weak var retweetImage: UIImageView!
    @IBOutlet weak var retweetInfoTopConstraint: NSLayoutConstraint!
    
    var tweet: Tweet! {
        didSet{
            guard let user = tweet.user else {
                print("User is nil")
                return
            }
            
            nameLabel.text = "Rajat"
            screennameLabel.text = user.screenname
            
            if let url = user.profileUrl {
                profileImage.setImageWith(url)
            }
            retweetInfo.text = tweet.retweetInfo ?? "No retweeted"
            tweetTextLabel.text = tweet.description
            
        }
    }
    
    

    @IBOutlet weak var profielImageTopConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onReply(_ sender: Any) {
        self.performSegue(withIdentifier: "replySegue", sender: nil)
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let composeViewController = navigationController.topViewController as! ComposeViewController
        composeViewController.replyId = 1
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
