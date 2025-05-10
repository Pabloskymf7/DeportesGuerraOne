//
//  MenuViewController.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 13/4/25.
//

import UIKit

class MenuViewController: UIViewController {
    // MARK: - IBOutlet
//    @IBOutlet weak var titleTextLabel: UILabel!
//    @IBOutlet weak var chooseExerciseTextLabel: UILabel!
//    @IBOutlet weak var cardioTextLabel: UILabel!
//    @IBOutlet weak var olympicTextLabel: UILabel!
//    @IBOutlet weak var pliometricsTextLabel: UILabel!
//    @IBOutlet weak var strengthTextLabel: UILabel!
//    @IBOutlet weak var strongmanTextLabel: UILabel!
//    @IBOutlet weak var powerliftingTextLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel: MenuViewModelProtocol!
    var delegate: HomeDelegateProtocol!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    // MARK: - IBAction
//    @IBAction func goToCardioExercises(_ sender: Any) {
//        viewModel.goToCardioScreen()
//    }
//
//    @IBAction func goToOlympicExercises(_ sender: Any) {
//        viewModel.goToOlympicScreen()
//    }
//
//    @IBAction func goToPliometricsExercises(_ sender: Any) {
//        viewModel.goToPliometricsScreen()
//    }
//
//    @IBAction func goToStrengthExercises(_ sender: Any) {
//        viewModel.goToStrengthScreen()
//    }
//
//    @IBAction func goToStrongmanExercises(_ sender: Any) {
//        viewModel.goToStrongmanScreen()
//    }
//
//    @IBAction func goToPowerliftingExercises(_ sender: Any) {
//        viewModel.goToPowerliftingScreen()
//    }
}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 20  // Espacio entre las celdas
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath) as! HeaderTableViewCell
            headerCell.configureCell()
            return headerCell
        case 1:
            let firstBody = tableView.dequeueReusableCell(withIdentifier: "BodyTableViewCell", for: indexPath) as! BodyTableViewCell
            firstBody.delegate = viewModel as? HomeDelegateProtocol
            firstBody.setupNoProfessional()
            return firstBody
        case 2:
            let secondBody = tableView.dequeueReusableCell(withIdentifier: "BodyTableViewCell", for: indexPath) as! BodyTableViewCell
            secondBody.delegate = viewModel as? HomeDelegateProtocol
            secondBody.setupProfessional()
            return secondBody
        default:
            return UITableViewCell()
        }
    }
    
    func configureTableView() {
        let headerNib = UINib(nibName: "HeaderTableViewCell", bundle: nil)
        tableView.register(headerNib, forCellReuseIdentifier: "HeaderTableViewCell")

        let eventNib = UINib(nibName: "BodyTableViewCell", bundle: nil)
        tableView.register(eventNib, forCellReuseIdentifier: "BodyTableViewCell")

        tableView.contentInsetAdjustmentBehavior = .never
        tableView.dataSource = self
        tableView.delegate = self
    }
}
