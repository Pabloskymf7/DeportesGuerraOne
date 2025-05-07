//
//  RoutinesViewController.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 19/4/25.
//

import UIKit

class RoutinesViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: RoutinesViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        viewModel.viewDidLoad()
        setupUI()
    }
    
    func setupBindings() {
        viewModel.dataLoaded = {
            DispatchQueue.main.async{ [weak self] in
                guard let self else { return }
                self.tableView.reloadData()
            }
        }
    }
    private func setupUI() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.title = "Deportes Guerra"
        configureTable()
    }
}


extension RoutinesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.exercise.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoutinesTableViewCell", for: indexPath) as! RoutinesTableViewCell
        cell.configureCell(with: viewModel.exercise[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.goToDetailsRoutine(with: indexPath.row)
    }

    func configureTable() {
        let nib = UINib(nibName: "RoutinesTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "RoutinesTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}
