//
//  ViewController.swift
//  DataCoreApp
//
//  Created by student on 3/12/22.
//

import UIKit
import Foundation
import CoreData

class ViewController: UIViewController {
    
    var dataManager: NSManagedObjectContext! //Req for working with the database
    var listArray = [NSManagedObject]() // used to parse data

    @IBOutlet var enterText: UITextField!
    @IBOutlet var displayLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        dataManager = appDelegate.persistentContainer.viewContext
        displayLabel.text?.removeAll()
        fetchData()
    }
    
    func fetchData(){
        let fetchRequest : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Item") //pull the data from datacore
        do {
            let result = try dataManager.fetch(fetchRequest)
            listArray = result as! [NSManagedObject]
            for item in listArray {
                let product = item.value(forKey: "about") as! String
                displayLabel.text! += product
            }
        } catch {
            print("Error requesting data")
        }
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        let newEntity = NSEntityDescription.insertNewObject(forEntityName: "Item", into: dataManager)
        newEntity.setValue(enterText.text!, forKey: "about")
        
        do{
            try self.dataManager.save()
            listArray.append(newEntity)
        } catch {
            print("error saving data")
        }
        enterText.text?.removeAll()
        displayLabel.text?.removeAll()
        fetchData()
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        let deleteItem = displayLabel.text!
        for item in listArray{
            if item.value(forKey: "about") as! String == deleteItem {
                dataManager.delete(item)
            }
            do{
                try self.dataManager.save()
            } catch {
                print("error saving data")
            }
            displayLabel.text?.removeAll()
            enterText.text?.removeAll()
            fetchData() //without this it will error if theres no data in the property.
        }
    }
    
}

