//
//  Coredata_SampleTests.swift
//  Coredata SampleTests
//
//  Created by gowri anguraj on 10/01/20.
//  Copyright © 2020 gowri anguraj. All rights reserved.
//

import XCTest
@testable import Coredata_Sample

class ViewControllerTests: XCTestCase {

    var vc : ViewController!
    var  tableView : UITableView!
    var userArray : DogList?
    
    func testInitMyTableView() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        _  = vc.view
        vc.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: Bundle(for: UITableViewCell.classForCoder())), forCellReuseIdentifier: "cell")
        XCTAssertNotNil(vc.tableView)
    }

    func testTableViewDatasource() {
    
        XCTAssertEqual(vc.tableView(tableView,numberOfRowsInSection:1), 2)

    }
    func testTableViewCellForRowAtIndexPath() {
       let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? CustomTableViewCell
        XCTAssertEqual(cell?.lbldogName.text!, "puppy")
        XCTAssertEqual(cell?.lbldogDescription.text!, "puppy is cute and active")
        }
    
}
