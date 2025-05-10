//
//  MenuViewController.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 13/4/25.
//

import UIKit

class MenuViewController: UIViewController {
    // MARK: - IBOutlet
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
}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 20
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
