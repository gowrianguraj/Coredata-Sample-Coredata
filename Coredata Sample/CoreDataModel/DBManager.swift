//
//  DBManager.swift
//  Coredata Sample
//
//  Created by gowri anguraj on 10/01/20.
//  Copyright © 2020 gowri anguraj. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class DBManager {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //MARK:- Coredata Persistent 
    func addImageHistory(dogName: String , ownername : String ,dogDescription : String ,dogImage : Data) {
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "DogList", into: context) as! DogList
        entity.setValue(dogName,forKeyPath: "dogName")
        entity.setValue(ownername, forKeyPath: "owner")
        entity.setValue(dogDescription, forKeyPath: "dogDescription")
        entity.setValue(dogImage, forKeyPath: "dogImage")
        do {
            try context.save()
        
        } catch {
            print(error.localizedDescription)
        }

    }

}
