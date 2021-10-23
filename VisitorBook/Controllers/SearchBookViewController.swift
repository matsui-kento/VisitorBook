//
//  SearchBookViewController.swift
//  VisitorBook
//
//  Created by matsui kento on 2021/10/23.
//

import UIKit

class SearchBookViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .onDrag
    }

}

extension SearchBookViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        guard let passwordVC = self.storyboard?.instantiateViewController(withIdentifier: "PasswordViewController") as? PasswordViewController else {
            fatalError("PasswordViewController is not found")
        }
        
        self.present(passwordVC, animated: true, completion: nil)
    }
}

extension SearchBookViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

