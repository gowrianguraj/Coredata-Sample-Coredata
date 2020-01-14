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
        DispatchQueue.main.async {
            self.getValues()
            self.tableView?.reloadData()
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpID") as! PopUpViewController
        popOverVC.details = (userArray[indexPath.row])
        self.addChild(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)

    }
}
