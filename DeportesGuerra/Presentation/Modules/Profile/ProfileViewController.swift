//
//  ProfileViewController.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 5/4/25.
//

import UIKit

class ProfileViewController: UIViewController {
    var viewModel: ProfileViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
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
