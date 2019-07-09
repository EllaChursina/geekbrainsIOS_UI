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
    
    @IBOutlet var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector:
            #selector(keyboardWasShown(notification:)), name:
            UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:
            #selector(keyboardWasHidden(notification:)), name:
            UIResponder.keyboardWillHideNotification, object: nil)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
        
        navigationController?.navigationBar.isHidden = false 
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

   @IBAction func logInButtonPress(_ sender: Any) {
        print("username: \(userNameTextField.text ?? "")")
        print("username: \(passwordTextField.text ?? "")")
        
        performSegue(withIdentifier: "LoginSegue", sender: nil)
        
    }
    
    @objc private func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo as NSDictionary?
        let keyboardSize = (info?.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as!
        NSValue).cgRectValue.size
        let contentInsent = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        scrollView.contentInset = contentInsent
        scrollView.scrollIndicatorInsets = contentInsent
    }
    
    @objc private func keyboardWasHidden(notification: Notification) {
        let contentInsent = UIEdgeInsets.zero
        scrollView.contentInset = contentInsent
        scrollView.scrollIndicatorInsets = contentInsent
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        if shouldPerformSegue(withIdentifier: identifier, sender: sender) {
            super.performSegue(withIdentifier: identifier, sender: sender)
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "LoginSegue",
            userNameTextField.text == "",
            passwordTextField.text == "" {
            return true
        } else {
            return false
        }
    }
    
    
    
}

/*import UIKit
 
 class FriendsController: UITableViewController {
 
 var namesOfFriend = [
 "Саша Иванов",
 "Дарья Петрова",
 "Йося Кауфман",
 "Анна Степанова",
 "Мария Кац",
 "Иван Сидоров",
 "Моше Коэн"
 ]
 
 override func viewDidLoad() {
 super.viewDidLoad()
 }
 
 override func didReceiveMemoryWarning() {
 super.viewDidLoad()
 }
 override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 return namesOfFriends.count
 }
 
 }*/
