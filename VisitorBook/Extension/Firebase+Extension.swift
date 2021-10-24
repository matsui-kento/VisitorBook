//
//  Firebase+Extension.swift
//  VisitorBook
//
//  Created by matsui kento on 2021/10/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

extension Auth {
    
    static func registerUserWithAuthAndFirestore(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
                print("FirebaseAuthでのユーザーの登録に失敗しました。")
                completion(false)
                return
            }
            print("FirebaseAuthでのユーザーの登録に成功しました。")
            
            guard let uid = result?.user.uid else { return }
            let data:[String: Any] = [
                "email": email,
                "uid": uid
            ]
            
            Firestore.registerUserWithFirestore(data: data, uid: uid) { success in
                completion(success)
            }
        }
    }
    
    static func loginUserWithAuth(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                print("ログインに失敗しました。")
                completion(false)
                return
            }
            
            print("ログインに成功しました。")
            completion(true)
        }
    }
    
}

extension Firestore {
    
    static func registerUserWithFirestore(data: [String: Any], uid: String, completion: @escaping (Bool) -> Void) {
        Firestore.firestore().collection("Users").document(uid).setData(data) { error in
            if let error = error {
                print(error.localizedDescription)
                print("Firestoreでのユーザーの登録に失敗しました。")
                completion(false)
                return
            }
            print("Firestoreでのユーザーの登録に成功しました。")
            completion(true)
        }
    }
}
