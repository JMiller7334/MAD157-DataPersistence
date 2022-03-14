//
//  ViewControllerTextSave.swift
//  DataPersistence1
//
//  Created by student on 3/11/22.
//

import UIKit

class ViewControllerTextSave: UIViewController {
    @IBOutlet var typeTextHere: UITextView!
    @IBOutlet var displayTextHere: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeTextHere.text = "Type your Text here."
        displayTextHere.text = ""
        // Do any additional setup after loading the view.
    }
    
    @IBAction func writeMyText(_ sender: Any) {
        let fm = FileManager.default // the file manager being used to write.
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask) //the url(location)
        let url = urls.last?.appendingPathComponent("file.text") //this adds onto the current data that has been saved.
        
        // try catch - think of this like a protected call
        do{
            try typeTextHere.text.write(to: url!, atomically: true, encoding: String.Encoding.utf8) // the action being performed
        } catch{
            print("error saving data") //what happens if it fails
        }
    }
    
    @IBAction func readMyText(_ sender: Any) {
        let fm = FileManager.default // the file manager being used to write.
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask) //the url(location) I think
        let url = urls.last?.appendingPathComponent("file.text") //the propertie of the UI Element, etc thats to being read.
        do {
            // try to find the data
            let fileContent = try String.init(contentsOf: url!, encoding: String.Encoding.utf8)
            displayTextHere.text = fileContent //if found, display it
        } catch {
            print("error loading file") // otherwise show an error
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
