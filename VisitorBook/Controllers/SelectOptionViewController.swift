//
//  SelectOptionViewController.swift
//  VisitorBook
//
//  Created by matsui kento on 2021/10/24.
//

import UIKit

class SelectOptionViewController: UIViewController {

    @IBOutlet weak var deceasedNameLabel: UILabel!
    @IBOutlet weak var chiefMournerNameLabel: UILabel!
    @IBOutlet weak var decriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func toConfirmAttendeeVC(_ sender: Any) {
        guard let confirmAttendeeVC = self.storyboard?.instantiateViewController(withIdentifier: "ConfirmAttendeeVC") as? ConfirmAttendeeViewController else {
            fatalError("ConfirmAttendeeViewController is not found")
        }
        self.navigationController?.pushViewController(confirmAttendeeVC, animated: true)
    }
    
    @IBAction func deleteBook(_ sender: Any) {
    }
}
