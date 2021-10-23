//
//  ConfirmBookViewController.swift
//  VisitorBook
//
//  Created by matsui kento on 2021/10/23.
//

import UIKit

class ConfirmBookViewController: UIViewController {

    @IBOutlet weak var deceasedNameLabel: UILabel!
    @IBOutlet weak var ChiefMournerNameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func toWriteBookVC(_ sender: Any) {
        guard let passwordVC = self.storyboard?.instantiateViewController(withIdentifier: "WriteBookVC") as? WriteBookViewController else {
            fatalError("WriteBookViewController is not found")
        }
        
        self.present(passwordVC, animated: true, completion: nil)
    }
}
