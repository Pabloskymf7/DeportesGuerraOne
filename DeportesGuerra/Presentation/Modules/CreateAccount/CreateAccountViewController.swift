//
//  CreateAccountViewController.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 12/5/25.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class CreateAccountViewController: UIViewController, UITextFieldDelegate {
    //MARK: - IBOutlet
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var deportesGuerraLabel: UILabel!
    @IBOutlet weak var createYourAccountLabel: UILabel!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var phoneNumberLabel: UITextField!
    @IBOutlet weak var weigthLabel: UITextField!
    @IBOutlet weak var heigthLabel: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    //MARK: - Properties
    var viewModel: CreateAccountViewModel!
    
    //MARK: - LifeCycle 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupKeyboardObservers()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: - Functions
    func setupUI() {
        tapGestures()
        addDelegateToTextFields()
        styleTextFields()
        styleLogoImage()
        
        deportesGuerraLabel.font = UIFont(name: "SourceSans3-Bold", size: 30)
        createYourAccountLabel.font = UIFont(name: "SourceSans3-Regular", size: 16)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func addDelegateToTextFields() {
        emailLabel.delegate = self
        usernameLabel.delegate = self
        passwordLabel.delegate = self
        phoneNumberLabel.delegate = self
        weigthLabel.delegate = self
        heigthLabel.delegate = self
    }

    
    func tapGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            view.addGestureRecognizer(tapGesture)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailLabel:
            usernameLabel.becomeFirstResponder()
        case usernameLabel:
            passwordLabel.becomeFirstResponder()
        case passwordLabel:
            phoneNumberLabel.becomeFirstResponder()
        case phoneNumberLabel:
            weigthLabel.becomeFirstResponder()
        case weigthLabel:
            heigthLabel.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }

    func saveAdditionalUserData(uid: String) {
        let db = Firestore.firestore()
        
        let additionalData: [String: Any] = [
            "phoneNumber": phoneNumberLabel.text ?? "",
            "weight": weigthLabel.text ?? "",
            "height": heigthLabel.text ?? "",
            "username": usernameLabel.text ?? "",
            "email": emailLabel.text ?? ""
        ]
        
        // Guarda los datos en la colección 'users', documento con el uid
        db.collection("users").document(uid).setData(additionalData, merge: true) { error in
            if let error = error {
                print("❌ Error saving to Firestore: \(error.localizedDescription)")
            } else {
                print("✅ User data saved successfully in Firestore.")
            }
        }
    }

    func styleTextFields() {
        let textFields = [
            emailLabel,
            usernameLabel,
            passwordLabel,
            phoneNumberLabel,
            weigthLabel,
            heigthLabel
        ]
        
        for textField in textFields {
            textField?.layer.cornerRadius = 10
            textField?.layer.borderWidth = 0.5
            textField?.layer.borderColor = UIColor.lightGray.cgColor
            textField?.layer.masksToBounds = true
            textField?.setLeftPaddingPoints(8) // opcional: padding a la izquierda
        }
    }

    func styleLogoImage() {
        logoImage.layer.cornerRadius = logoImage.frame.height / 2
        logoImage.layer.masksToBounds = true
//        logoImage.layer.borderWidth = 0.5
//        logoImage.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    @objc func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }

        let keyboardHeight = keyboardFrame.height
        scrollView.contentInset.bottom = keyboardHeight
        scrollView.verticalScrollIndicatorInsets.bottom = keyboardHeight
    }

    @objc func keyboardWillHide(notification: Notification) {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let convertedFrame = textField.convert(textField.bounds, to: scrollView)
        scrollView.scrollRectToVisible(convertedFrame, animated: true)
    }
    
    //MARK: - IBAction
    @IBAction func createAccountButton(_ sender: Any) {
        let registersUserRequest = RegisterUserRequest(username: self.usernameLabel.text ?? "",
                                                       email: self.emailLabel.text ?? "",
                                                       password: self.passwordLabel.text ?? "")
    
        if !Validator.isValidUsername(for: registersUserRequest.username) {
            AlertManager.showInvalidUsernameAlert(on: self)
            return
        }
        
        if !Validator.isValidEmail(for: registersUserRequest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        if !Validator.isPasswordValid(for: registersUserRequest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        AuthService.shared.registrerUser(with: registersUserRequest) { wasRegistered, error in
            if let error = error {
                AlertManager.showRegistrationErrorAlert(on: self, with: error)
                return
            } 
            
            if wasRegistered {
                // ✅ AQUÍ colocas el guard para obtener el UID y guardar datos en Firestore
                guard let userId = Auth.auth().currentUser?.uid else {
                    print("❌ User UID not found.")
                    return
                }
                self.saveAdditionalUserData(uid: userId)
                
                // Redirigir al usuario después de registrarse
                if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                    sceneDelegate.checkAuthentication()
                }
            } else {
                AlertManager.showRegistrationErrorAlert(on: self)
            }
        }
    }
}
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
