//
//  SettingViewController.swift
//  VisitorBook
//
//  Created by matsui kento on 2021/10/24.
//

import UIKit
import Firebase

protocol BackSettingVCProtocol {
    func updateButton(controller: UIViewController)
    func toLoginVCAfterPop(controller: UIViewController)
    func toRegisterVCAfterPop(controller: UIViewController)
}

class SettingViewController: UIViewController, BackSettingVCProtocol {
    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        updateButtonState()
    }
    
    @IBAction func toLoginVCAfterLogout(_ sender: Any) {
        logout()
        updateButtonState()
        translateLoginVC()
    }
    
    @IBAction func toLoginVC(_ sender: Any) {
        translateLoginVC()
    }
    
    @IBAction func toRegisterVC(_ sender: Any) {
        translateRegisterVC()
    }
    
    @IBAction func toPrivacyPolicyVC(_ sender: Any) {
        
    }
    
    private func translateLoginVC() {
        guard let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginViewController else {
            fatalError("LoginViewController is not found")
        }
        loginVC.delegate = self
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    private func translateRegisterVC() {
        guard let registerVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as? RegisterViewController else {
            fatalError("RegisterViewController is not found")
        }
        registerVC.delegate = self
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    private func logout() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            print("ログアウトしました。")
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    private func updateButtonState() {
        if ((Auth.auth().currentUser?.uid) == nil) {
            loginButton.isHidden = false
            registerButton.isHidden = false
            logoutButton.isHidden = true
        } else {
            loginButton.isHidden = true
            registerButton.isHidden = true
            logoutButton.isHidden = false
        }
    }
    
    func updateButton(controller: UIViewController) {
        controller.navigationController?.popViewController(animated: true)
        self.updateButtonState()
    }
    
    func toLoginVCAfterPop(controller: UIViewController) {
        controller.navigationController?.popViewController(animated: true)
        self.translateLoginVC()
    }
    
    func toRegisterVCAfterPop(controller: UIViewController) {
        controller.navigationController?.popViewController(animated: true)
        self.translateRegisterVC()
    }
}
