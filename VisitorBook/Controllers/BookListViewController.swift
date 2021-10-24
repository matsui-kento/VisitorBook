//
//  BookListViewController.swift
//  VisitorBook
//
//  Created by matsui kento on 2021/10/24.
//

import UIKit

class BookListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension BookListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VisiterBookTableViewCell", for: indexPath) as? VisiterBookTableViewCell else {
            fatalError("VisiterBookTableViewCell is not found")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectOptionVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectOptionVC") as? SelectOptionViewController else {
            fatalError("SelectOptionViewController is not found")
        }
        self.navigationController?.pushViewController(selectOptionVC, animated: true)
    }
}
