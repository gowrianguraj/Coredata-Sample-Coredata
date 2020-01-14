//
//  AddDogListViewController.swift
//  Coredata Sample
//
//  Created by gowri anguraj on 10/01/20.
//  Copyright © 2020 gowri anguraj. All rights reserved.
//

import UIKit
import Foundation

class AddDogListViewController:
UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    //MARK: - Properties
    @IBOutlet weak var dogNameTxt : UITextField!
    @IBOutlet weak var ownerNameTxt : UITextField!
    @IBOutlet weak var dogDescriptionTxt : UITextField!
    @IBOutlet weak var selectImg : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Save the coredata values
    @IBAction func saveDog(_sender : UIButton) {
        
        guard let dogname = dogNameTxt.text else {
                return
        }
        guard let ownername = ownerNameTxt.text else {
            return
        }
        guard let dogdescription = dogDescriptionTxt.text else {
            return
        }
        guard  let png = selectImg.image?.pngData() else {
            return
        }
        
       let dbObj = DBManager()
       dbObj.addImageHistory(dogName: dogname, ownername: ownername ,dogDescription: dogdescription,dogImage :png)
        
        dismiss(animated: true, completion: nil)
        
    }
    
    //MARK :- Action to select the photo from pickerVC
    @IBAction func selectPhoto(_sender: UIButton){
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
       let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
            actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
                
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    imagePicker.sourceType = .camera
                    self.present(imagePicker,animated: true,completion: nil)
                } else {
                    let alert = UIAlertController(title: "Oops", message: "Camera not available", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
          
        }))
        
         actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {(action: UIAlertAction) in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker,animated: true,completion: nil)
         }))
        
         actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        self.present(actionSheet,animated: true,completion: nil)
    }
    
    //MARK: - PickerVC Delegates
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        selectImg.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

