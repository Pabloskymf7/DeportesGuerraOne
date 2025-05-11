//
//  LoginViewController.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 5/4/25.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    //MARK: - IBOutlet
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var eyeImage: UIImageView!

    //MARK: - Properties
    var viewModel: LoginViewModel!
    
    //MARK: - LifeCycle 
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGestures()
        addDelegateToTextFields()
    }
    
    //MARK: - Functions
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func tapGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            view.addGestureRecognizer(tapGesture)
    }
    
    func addDelegateToTextFields() {
        passwordTextField.delegate = self
        emailTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    //MARK: - IBActions
    @IBAction func didLoginButton(_ sender: Any) {
        let loginRequest = LoginUserRequest (email: self.emailTextField.text ?? "",
                                             password: self.passwordTextField.text ?? "")
        if !Validator.isValidEmail(for: loginRequest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        if !Validator.isPasswordValid(for: loginRequest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        AuthService.shared.signIn(with: loginRequest) { error in
            if let error = error {
                AlertManager.showSignInErrorAlert(on: self, with: error)
                return
            }
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.checkAuthentication()
            }
        }
    }
    
    @IBAction func didCreateAccount(_ sender: Any) {
    }
    
    @IBAction func didHidenEyeImage(_ sender: Any) {
        passwordTextField.isSecureTextEntry.toggle()
        eyeImage.image = UIImage(systemName: passwordTextField.isSecureTextEntry ? "eye.fill" : "eye.slash.fill")
    }
}
