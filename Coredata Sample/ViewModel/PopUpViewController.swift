//
//  PopUpViewController.swift
//  Coredata Sample
//
//  Created by gowri anguraj on 13/01/20.
//  Copyright © 2020 gowri anguraj. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var dogImg : UIImageView!
    @IBOutlet weak var dogName : UILabel!
    @IBOutlet weak var dogdescription : UILabel!
    
     var details : DogList?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        setUpUI()
        self.showAnimate()
        
    }
    
    //MARK: - Close the popup
    @IBAction func closePopUp (sender : UIButton) {
        self.removeAnimate()
    }
    
    //MARK:- Update UI
    func setUpUI() {
        dogName.text = details?.dogName
        dogdescription.text = details?.dogDescription
        if let displayImg = details?.dogImage {
            dogImg?.image = UIImage(data: displayImg)
        }
    }
    
    //MARK:- Present & Stop animation for View
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    

}
