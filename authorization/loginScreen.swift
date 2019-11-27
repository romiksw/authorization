//
//  loginScreen.swift
//  authorization
//
//  Created by Roman Kozlov on 26.11.2019.
//  Copyright © 2019 Roman Kozlov. All rights reserved.
//

import UIKit

class loginScreen: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    var users = [
        "User": "Password",
        "Roma": "admin",
        "Anton": "Ant"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func logInButton() {
        checkingTextfields()
    }
    
    @IBAction func forgotNameButton() {
        showAlert(title: "Ooooops!", message: "Yor name is User")
    }
    
    @IBAction func forgotPasswordButton() {
        showAlert(title: "Ooooops!", message: "Yor password is Password")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
    
    func checkingTextfields() {
        guard let userName = userNameTextField.text else { return }
        guard let userPassword = passwordTextField.text else { return }
        
        checkLoginPassword(userName: userName, userPassword: userPassword)
    }
    
    func checkLoginPassword(userName: String, userPassword: String) {
        if let value = users[userName] {
            if userPassword == value {
                performSegue(withIdentifier: "trueLogIn", sender: nil)
            } else {
                showAlert(title: "Invalid login or password", message: "Please, enter correct")
            }
        } else {
            showAlert(title: "Invalid login or password", message: "Please, enter correct")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVc = segue.destination as! ViewController
        secondVc.name = userNameTextField.text
    }
}

extension loginScreen {
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(ok)
        present(alert, animated: true)
    }
}

extension loginScreen: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == passwordTextField {
            checkingTextfields()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

