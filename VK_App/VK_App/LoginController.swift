//
//  ViewController.swift
//  VK_App
//
//  Created by MacBook on 27/06/2019.
//  Copyright © 2019 EllaChursina. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    @IBAction func logInButtonPress(_ sender: Any) {
        print("username: \(userNameTextField.text)")
        print("username: \(passwordTextField.text)")
    }
}

