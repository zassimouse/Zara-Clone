//
//  CategoryManager.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 2.10.24.
//

import Foundation
import FirebaseDatabase

class CategoryManager {

    static let shared = CategoryManager()

    private var ref: DatabaseReference!

    private init() {
        let databaseURL = "https://fashion-store-80202-default-rtdb.europe-west1.firebasedatabase.app"
        ref = Database.database(url: databaseURL).reference()
    }

    func fetchCategories(completion: @escaping ([String: [String: Int]]) -> Void) {
        ref.child("categories").observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? [String: Any] else {
                completion([:]) // Return empty dictionary if error occurs
                return
            }

            var categories: [String: [String: Int]] = [:]

            if let manCategories = value["man"] as? [String: Int] {
                categories["man"] = manCategories
            }

            if let womanCategories = value["woman"] as? [String: Int] {
                categories["woman"] = womanCategories
            }

            completion(categories)
        }
    }
}
