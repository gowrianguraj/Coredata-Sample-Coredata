//
//  DBManagerTest.swift
//  Coredata Sample
//
//  Created by gowri anguraj on 14/01/20.
//  Copyright © 2020 gowri anguraj. All rights reserved.
//

import XCTest
@testable import Coredata_Sample
import CoreData

class DBManagerTest: XCTestCase {
    
    var dbManager : DBManager!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func test_coreDataStackInitialization() {
        let coreDataStack = appDelegate.persistentContainer
        XCTAssertNotNil( coreDataStack )
    }
    func test_create_person() {
        let dogName = "Puppy"
        let ownername = "Gowri"
        let dogDescription = "puppy is cute and active"
        
        let imageUrlString = "http://cdn.playbuzz.com/cdn/38402fff-32a3-4e78-a532-41f3a54d04b9/cc513a85-8765-48a5-8481-98740cc6ccdc.jpg"
        let imageUrl = URL(string: imageUrlString)!
        guard let imageData = try? Data(contentsOf: imageUrl) else { return }
        let person1 = dbManager.addImageHistory(dogName: dogName, ownername: ownername, dogDescription: dogDescription, dogImage: imageData)
        XCTAssertNotNil(person1)
        
    }


}
