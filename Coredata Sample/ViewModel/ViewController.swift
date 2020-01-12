//
//  ViewController.swift
//  Coredata Sample
//
//  Created by gowri anguraj on 10/01/20.
//  Copyright © 2020 gowri anguraj. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    //MARK :- Properties
    @IBOutlet weak var tableView: UITableView!
    
    var userArray :[DogList]! {
        didSet {
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }
     let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
         getValues()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView?.reloadData()
    }
    
    //MARK : - Fetch the coredata values
    func getValues() {
        let context = appDelegate.persistentContainer.viewContext
        let request = DogList.createFetchRequest()
        request.returnsObjectsAsFaults = false
        do {
            userArray = try context.fetch(request)
        } catch {
            print(error.localizedDescription)
        }

}
    
    //MARK: - Incase of future implementation to clear the tableview list
    @IBAction func clearTableList(_sender :UIButton) {
        let dbManager = DBManager()
        if dbManager.clearHistory() {
            userArray?.removeAll()
        }
    }
}
//MARK: - TableviewDelegates,Datasource
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      return userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let tablecell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        tablecell.userObj = (userArray[indexPath.row])
        return tablecell
    }
}
