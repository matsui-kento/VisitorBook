//
//  CreateDescriptionViewController.swift
//  VisitorBook
//
//  Created by matsui kento on 2021/10/24.
//

import UIKit

class CreateDescriptionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func toCreateBookFormVC(_ sender: Any) {
        guard let createBookFormVC = self.storyboard?.instantiateViewController(withIdentifier: "CreateBookFormVC") as? CreateBookFormViewController else {
            fatalError("PasswordViewController is not found")
        }
        self.navigationController?.pushViewController(createBookFormVC, animated: true)
    }
    
    
}
