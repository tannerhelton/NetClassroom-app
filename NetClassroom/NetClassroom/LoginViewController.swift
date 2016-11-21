//
//  LoginViewController.swift
//  NetClassroom
//
//  Created by Tanner Helton on 11/8/16.
//  Copyright © 2016 Rockhurst Highschool. All rights reserved.
//
//https://spreadsheets.google.com/feeds/list/1_3y0KFlA7lbCbqn6HtX5Y4kjcbr8sFmaEFeohdC0ji8/od6/public/values?alt=json
//

import UIKit

class LoginViewController: UIViewController {
    
    var people: NSArray = []
    var peopleIndex = 0
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var username = ""
    var password = ""
    
    func getSheet(url: String) {
        let url = URL(string: url)
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                print(error)
                return
            }
            
            guard let data = data else {
                print("Data is empty")
                return
            }
            
            let json =
                try! JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String, AnyObject>
            
            //callback(json)
            self.people = json["feed"]!["entry"] as! NSArray
            self.uiPump()
        }
        
        task.resume()
    }
    
    
    func uiPump() {
        let person = people[peopleIndex] as! Dictionary<String, AnyObject>
        let fname = person["gsx$firstname"]!["$t"]!
        let lname = person["gsx$lastname"]!["$t"]!
        let email = person["gsx$email"]!["$t"]!
        
        // instantly update the UI
        DispatchQueue.main.async(execute: {
            self.firstname.text = fname  as? String
            self.lastname.text = lname as? String
            self.email.text = email as? String
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sheet = "https://spreadsheets.google.com/feeds/list/1QaEp58fpTaxBkHT0BPlAOQ_HxL7K5epRo1Uv_ajIGDw/od6/public/values?alt=json"
        getSheet(url: sheet)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    func login( usr: String, pswrd: String) {
        print(usr)
        print(pswrd)
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        username = txtUsername.text!
        password = txtPassword.text!
        login(username, password)
    }
}
