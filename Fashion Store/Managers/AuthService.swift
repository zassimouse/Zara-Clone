//
//  AuthService.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 16.03.24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService {
    
    public static let shared = AuthService()
    
    private init() {}
    
    
    /// A method to
    /// - Parameters:
    ///   - userRequest: The
    ///   - completion: A completion with two values
    ///   - Bool: wasRegistered - Determines if the user was registered and saved in the database correctly
    ///   - Error?: An optional error if Firebase provides one
    public func registerUser(with userRequest: RegisterUserRequest,
                             completion: @escaping (Bool, Error?)->Void) {
        
        let name = userRequest.name
        let email = userRequest.email
        let password = userRequest.password
        
        // Create new user
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error {
                completion(false, error)
                return
            }
            
            guard let resultUser = result?.user else {
                completion(false, nil)
                return
            }
            
            // If successful save to db 
            let db = Firestore.firestore()
            
            db.collection("users")
                .document(resultUser.uid)
                .setData([
                    "name": name,
                    "email": email
                ]) { error in
                    
                    if let error = error {
                        completion(false, error)
                        return
                    }
                    completion(true, nil)
                }
            
            
        }
    }
    
    
    public func signIn(userRequest: LoginUserRequest, completion: @escaping (Error?)->Void) {
        
        Auth.auth().signIn(withEmail: userRequest.email, password: userRequest.password) { result, error in
            if let error = error {
                completion(error)
                return
            } else {
                completion(nil)
            }
        }
    }
    
    public func signOut(completion: @escaping (Error?)->Void) {
        do {
            try Auth.auth().signOut()
            completion(nil)
        } catch let error {
            completion(error)
        }
    }
    
    public func forgotPassword(with email: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            completion(error)
        }
    }
    
    public func fetchUser(completion: @escaping (User?, Error?) -> Void) {
        guard let userUID = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userUID)
            .getDocument { snapshot, error in
                if let error = error {
                    completion(nil, error)
                    return
                }
                
                if let snapshot = snapshot,
                   let snapshotData = snapshot.data(),
                   let name = snapshotData["name"] as? String,
                   let email = snapshotData["email"] as? String {
                    let user = User(name: name, email: email, userId: userUID)
                    print(user)
                    completion(user, nil)
                    return
    
                }
            }
        
        
    }
    
}
