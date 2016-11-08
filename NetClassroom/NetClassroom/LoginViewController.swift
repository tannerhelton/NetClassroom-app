//
//  LoginViewController.swift
//  NetClassroom
//
//  Created by Tanner Helton on 11/8/16.
//  Copyright © 2016 Rockhurst Highschool. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var username = ""
    var password = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
