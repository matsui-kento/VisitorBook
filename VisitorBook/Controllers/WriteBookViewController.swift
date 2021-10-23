//
//  WriteBookViewController.swift
//  VisitorBook
//
//  Created by matsui kento on 2021/10/23.
//

import UIKit

class WriteBookViewController: UIViewController {

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var phoneLabel: UITextField!
    @IBOutlet weak var companyLabel: UITextField!
    @IBOutlet weak var relationshipLabel: UITextField!
    @IBOutlet weak var addressTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func writeDoneButton(_ sender: Any) {
    }

}
