//
//  CustomTableViewCell.swift
//  Sample
//
//  Created by gowri anguraj on 22/10/19.
//  Copyright © 2019 gowri anguraj. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var lbldogName : UILabel!
    @IBOutlet weak var lbldogDescription : UILabel!
    @IBOutlet weak var tblImageUrl : UIImageView!
    
    var userObj : DogList! {
        didSet {
            lbldogName?.text = userObj.dogName
            lbldogDescription?.text = userObj.dogDescription
            if let displayImg = userObj.dogImage {
            tblImageUrl?.image = UIImage(data: displayImg)
        }
    }
}
   
}
