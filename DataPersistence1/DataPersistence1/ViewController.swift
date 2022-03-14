//
//  ViewController.swift
//  DataPersistence1
//
//  Created by student on 3/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mySerialNumber: UITextField!
    @IBOutlet var mySlider: UISlider!
    @IBOutlet var mySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: Button functions
    // could of named these better
    @IBAction func onSaved(_ sender: Any) {
        UserDefaults.standard.set(mySerialNumber.text, forKey: "Text") // this is what saves the data; The key is how it's retreived.
        UserDefaults.standard.set(mySlider.value, forKey: "Slider")
        UserDefaults.standard.set(mySwitch.isOn, forKey: "Switch")
    }
    
    @IBAction func onLoad(_ sender: Any) {
        mySerialNumber.text = UserDefaults.standard.string(forKey: "Text") //key to find the text that was saved
        mySlider.value = UserDefaults.standard.float(forKey: "Slider")
        mySwitch.isOn = UserDefaults.standard.bool(forKey: "Switch")
    }
    
    @IBAction func onDelete(_ sender: Any) {
        mySerialNumber.text = ""
        mySlider.value = 0.5
        mySwitch.isOn = true
    }
    
}

