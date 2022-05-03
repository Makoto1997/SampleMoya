//
//  ListViewController.swift
//  SampleMoya
//
//  Created by Makoto on 2022/05/01.
//

import UIKit

final class ListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib.init(nibName: TableViewCell.className, bundle: nil), forCellReuseIdentifier: TableViewCell.className)
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    private var gitHubModels: [GitHubModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GitHubAPI.user.get { [weak self] result in
            switch result {
            case .success(let res):
                guard let self = self else { return }
                self.gitHubModels = res
                self.tableView.reloadData()
            case .failure(let err):
                print("失敗しました。", err)
            }
        }
    }
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return gitHubModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.className) as? TableViewCell else { fatalError() }
        let gitHubModel = gitHubModels[indexPath.row]
        cell.configure(gitHubModel: gitHubModel)
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let gitHubModel = gitHubModels[indexPath.row]
        Router.shared.showWeb(from: self, gitHubModel: gitHubModel)
    }
}
