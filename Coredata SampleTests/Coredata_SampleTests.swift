//
//  Coredata_SampleTests.swift
//  Coredata SampleTests
//
//  Created by gowri anguraj on 10/01/20.
//  Copyright © 2020 gowri anguraj. All rights reserved.
//

import XCTest
@testable import Coredata_Sample
import CoreData

class Coredata_SampleTests: XCTestCase {
    
    var dbManager : DBManager!
    var vc : ViewController!
    var  tableView : UITableView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        _  = vc.view
      
    }
    
    func testInitMyTableView() {
      
        XCTAssertNotNil(vc.tableView)
    }

   
    func testTableViewDatasource() {
         XCTAssertEqual(tableView.dataSource!.tableView(tableView, numberOfRowsInSection: 0), 2, "After adding one person number of rows should be 1")

    }
    func testTableViewCellForRowAtIndexPath() {
        let indexPath = NSIndexPath(row: 1, section: 0)
        let cell = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 1, section: 0)) as! CustomTableViewCell
        XCTAssertEqual(cell.lbldogName.text!, "puppy")
        XCTAssertEqual(cell.lbldogDescription.text!, "puppy is cute and active")
    
    }
    
    func test_init_coreDataManager(){
        /*Asserts that an expression is not nil.
         Generates a failure when expression == nil.*/
    }
    
    func test_coreDataStackInitialization() {
        let coreDataStack = appDelegate.persistentContainer
        /*Asserts that an expression is not nil.
         Generates a failure when expression == nil.*/
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
      
        /*Asserts that an expression is not nil.
         Generates a failure when expression == nil.*/
        XCTAssertNotNil(person1)
        
    }
}
