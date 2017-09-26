//
//  LoginViewController.swift
//  twitter
//
//  Created by Rajat Bhargava on 9/24/17.
//  Copyright © 2017 Rajat Bhargava. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class LoginViewController: UIViewController {
    
    let consumerKey = "EeHTyym25HNc21vjWpuvfIyHv"
    let consuemrSecret = "nnkCGQ2Xz9IQHozWNkiNWRXThdaAhwl0gos3iX0ITXqShv4WW5"
    let baseUrl = "https://api.twitter.com"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Login
    
    @IBAction func onLogin(_ sender: Any) {
        let twitterClient = BDBOAuth1SessionManager(baseURL: URL(string: baseUrl), consumerKey: consumerKey, consumerSecret: consuemrSecret)
        twitterClient?.deauthorize() // bug in BDBOAuth1Manager needs us to deauthorise
        // #1 get token
        let callbackURL = URL(string: "twitterdemo://oauth")
        twitterClient?.fetchRequestToken(withPath: "oauth/request_token", method: "GET", callbackURL: callbackURL, scope: nil, success: {(requestToken: BDBOAuth1Credential?) -> Void in
            print("I should have gotten a token")
            print("Request Token: \(requestToken?.token)")
            // #2 send the user to safari to login
            if let token = requestToken?.token {
                let authorizeUrl = URL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(token)")!
                UIApplication.shared.open(authorizeUrl, options: [:], completionHandler: nil)
            }
        
        }, failure: { (error: Error?) -> Void in
            print("Got a error:")
        })
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
