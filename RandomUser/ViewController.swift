//
//  ViewController.swift
//  RandomUser
//
//  Created by Rishabh Malhotra on 5/15/16.
//  Copyright © 2016 Rishabh Malhotra. All rights reserved.
//

import UIKit
// fill in the text boxes and add constraints

class ViewController: UIViewController {
    
    @IBOutlet var nameField: UILabel!
    
    @IBOutlet var genderField: UILabel!
    
    @IBOutlet var addressField: UILabel!
    
    @IBOutlet var emailField: UILabel!
    
    @IBOutlet var logindetailsField: UILabel!
    
    @IBOutlet var cellField: UILabel!

    @IBOutlet var nationalityField: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
            }
    
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        
        let url = NSURL(string: "https://randomuser.me/api/")!
        
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data,response, error) -> Void in
            
            if let urlContent = data {
                
                do {
                    
                    let JSONConversion = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)
                    
                    //print(JSONConversion["results"]!![0])//////////////////////
                    
                    let name:String = (((JSONConversion["results"]!![0]["name"]!!["first"]!!) as! String) + " " + ((JSONConversion["results"]!![0]["name"]!!["last"]!!) as! String))
                    
                    print (name)
                    
                    let gender:String = (JSONConversion["results"]!![0]["gender"]!!) as! String
                    
                    print (gender)
                    
                    let address:String = ("STREET:" + ((JSONConversion["results"]!![0]["location"]!!["street"]!!) as! String) + "," + "CITY:" + ((JSONConversion["results"]!![0]["location"]!!["city"]!!) as! String) + "," + "STATE:" + ((JSONConversion["results"]!![0]["location"]!!["state"]!!) as! String))
                    
                    print (address)
                    
                    let email:String = (JSONConversion["results"]!![0]["email"]!!) as! String
                    
                    print (email)
                    
                    let login:String = ("USERNAME:" + ((JSONConversion["results"]!![0]["login"]!!["username"]!!) as! String) + "," + "PASSWORD:" + ((JSONConversion["results"]!![0]["login"]!!["password"]!!) as! String))
                    
                    print (login)
                    
                    let cell:String = (JSONConversion["results"]!![0]["cell"]!!) as! String
                    
                    print (cell)
                    
                    let nationality:String = (JSONConversion["results"]!![0]["nat"]!!) as! String
                    
                    print (nationality)
                    
                    self.nameField.text = name
                    self.genderField.text = gender
                    self.addressField.text = address
                    self.emailField.text = email
                    self.logindetailsField.text = login
                    self.cellField.text = cell
                    self.nationalityField.text = nationality
                    
                    
                } catch {
                    
                    print("JSON Conversion Failed")
                    
                }
                
            }
            
        }
        
        task.resume()

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
