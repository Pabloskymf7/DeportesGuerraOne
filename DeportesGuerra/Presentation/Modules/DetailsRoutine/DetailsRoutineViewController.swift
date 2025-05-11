//
//  DetailsRoutineViewController.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 26/4/25.
//

import UIKit

class DetailsRoutineViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var exerciseNameLabel: UILabel!
    @IBOutlet weak var exerciseTypeLabel: UILabel!
    @IBOutlet weak var muscleLabel: UILabel!
    @IBOutlet weak var equipmentLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    //MARK: - Properties
    var viewModel: DetailsRoutineViewModelProtocol! 
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureScreen()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.tabBarController?.isTabBarHidden = true
    }
    
    //MARK: - Functions
    func configureScreen() {
        exerciseNameLabel.text = viewModel.exercise.name.capitalized 
        exerciseTypeLabel.text = viewModel.exercise.type.capitalized
        muscleLabel.text = viewModel.exercise.muscle.capitalized
        equipmentLabel.text = viewModel.exercise.equipment.capitalized
        difficultyLabel.text = viewModel.exercise.difficulty.capitalized
        instructionsLabel.text = viewModel.exercise.instructions
        
        setupUI()
    }
    
    func setupUI() {
        exerciseNameLabel.font = UIFont(name: "SourceSans3-Bold", size: 34)
        print(viewModel.exercise.instructions)
    }
}
