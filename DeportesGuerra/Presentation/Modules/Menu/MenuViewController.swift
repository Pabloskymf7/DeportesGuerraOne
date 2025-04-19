//
//  MenuViewController.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 13/4/25.
//

import UIKit

class MenuViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var chooseExerciseTextLabel: UILabel!
    @IBOutlet weak var cardioTextLabel: UILabel!
    @IBOutlet weak var olympicTextLabel: UILabel!
    @IBOutlet weak var pliometricsTextLabel: UILabel!
    @IBOutlet weak var strengthTextLabel: UILabel!
    @IBOutlet weak var strongmanTextLabel: UILabel!
    @IBOutlet weak var powerliftingTextLabel: UILabel!

    // MARK: - Properties
    var viewModel: MenuViewModelProtocol!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    // MARK: - IBAction
    @IBAction func goToCardioExercises(_ sender: Any) {
    }

    @IBAction func goToOlympicExercises(_ sender: Any) {
    }

    @IBAction func goToPliometricsExercises(_ sender: Any) {
    }

    @IBAction func goToStrengthExercises(_ sender: Any) {
    }

    @IBAction func goToStrongmanExercises(_ sender: Any) {
    }

    @IBAction func goToPowerliftingExercises(_ sender: Any) {
    }
    
}
