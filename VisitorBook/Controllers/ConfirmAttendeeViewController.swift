//
//  ConfirmAttendeeViewController.swift
//  VisitorBook
//
//  Created by matsui kento on 2021/10/24.
//

import UIKit

class ConfirmAttendeeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension ConfirmAttendeeViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        guard let detailAttendeeVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailAttendeeVC") as? DetailAttendeeViewController else {
            fatalError("DetailAttendeeViewController is not found")
        }
        self.navigationController?.pushViewController(detailAttendeeVC, animated: true)
    }
}
