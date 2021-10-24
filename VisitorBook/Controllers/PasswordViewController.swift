//
//  PasswordViewController.swift
//  VisitorBook
//
//  Created by matsui kento on 2021/10/23.
//

import UIKit

class PasswordViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func passwordDoneButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
