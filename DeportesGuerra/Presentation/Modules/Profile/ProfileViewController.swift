//
//  ProfileViewController.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 5/4/25.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class ProfileViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var profileImageUIImage: UIImageView!
    @IBOutlet weak var usernameTextLabel: UILabel!
    @IBOutlet weak var emailTextLabel: UILabel!
    @IBOutlet weak var heigthTextLabel: UILabel!
    @IBOutlet weak var weightTextLabel: UILabel!
    @IBOutlet weak var phoneNumberTextLabel: UILabel!
    
    @IBOutlet weak var defaultUsernameLabel: UILabel!
    @IBOutlet weak var defaultEmailLabel: UILabel!
    @IBOutlet weak var defaultHeightLabel: UILabel!
    @IBOutlet weak var defaultWeigthLabel: UILabel!
    @IBOutlet weak var defaultPhoneLabel: UILabel!
    
    //MARK: - Properties
    var viewModel: ProfileViewModelProtocol!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Functions
    func setupUI() {
        loadUserData()
        setupFonts()
    }
    
    func setupFonts() {
        defaultUsernameLabel.font = UIFont(name: "SourceSans3-Bold", size: 20)
        defaultEmailLabel.font = UIFont(name: "SourceSans3-Bold", size: 20)
        defaultHeightLabel.font = UIFont(name: "SourceSans3-Bold", size: 20)
        defaultWeigthLabel.font = UIFont(name: "SourceSans3-Bold", size: 20)
        defaultPhoneLabel.font = UIFont(name: "SourceSans3-Bold", size: 20)
    }
    //MARK: - Private Functions
    private func loadUserData() {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("Usuario no autenticado")
            return
        }
        
        let docRef = Firestore.firestore().collection("users").document(uid)
        
        docRef.getDocument { document, error in
            if let error = error {
                print("Error al obtener documento: \(error.localizedDescription)")
                return
            }
            
            guard let data = document?.data() else {
                print("No hay datos para el usuario")
                return
            }
            
            self.profileImageUIImage.image = UIImage(named: "PabloFoto")
            self.usernameTextLabel.text = data["username"] as? String ?? "Desconocido"
            self.emailTextLabel.text = data["email"] as? String ?? "Sin correo"
            self.heigthTextLabel.text = data["heigth"] as? String ?? "Desconocido" 
            self.weightTextLabel.text = data["weight"] as? String ?? "Desconocido"
            self.phoneNumberTextLabel.text = data["phoneNumber"] as? String ?? "Desconocido"
        }
    }
    
    
    
    //MARK: - IBActions
    @IBAction func didSignOut(_ sender: Any) {
        AuthService.shared.signOut { [weak self] error in
            if let error = error {
                LoginError.Error
            }
            if let sceneDelegate = self?.view.window?.windowScene?.delegate as? SceneDelegate{
                sceneDelegate.checkAuthentication()
            }
        }
    }
}
