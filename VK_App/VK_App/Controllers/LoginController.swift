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
    
    @IBOutlet weak var vkLabelTopConstraint: NSLayoutConstraint!
    
    @IBOutlet var lc: LikeControl!
    
    
   
    
    
    var wasAnimationShow = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vkLabelTopConstraint.constant -= scrollView.bounds.height
        self.view.isUserInteractionEnabled = true
        self.scrollView.isUserInteractionEnabled = true
        
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
        CustomLoaderView.instance.showLoader()
        UIView.animate(withDuration: 2.5, delay: 0,  animations: {() in
            self.vkLabelTopConstraint.constant = 20
            self.view.layoutIfNeeded()
                
        })
    }
    
   
    
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("hide")
        CustomLoaderView.instance.hideMyLoader()
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


