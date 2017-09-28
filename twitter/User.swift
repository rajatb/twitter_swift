//
//  User.swift
//  twitter
//
//  Created by Rajat Bhargava on 9/26/17.
//  Copyright © 2017 Rajat Bhargava. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var name: String?
    var screenname: String = "@"
    var profileUrl: URL?
    var tagline: String?
    
    init(dictionary: NSDictionary) {
        name = dictionary["name"] as? String
        screenname += (dictionary["screen_name"] as? String) ?? ""
        if let profileUrlString = dictionary["profile_image_url_https"] as? String {
            profileUrl = URL(string: profileUrlString)
        }

        tagline = dictionary["description"] as? String
    }
}
