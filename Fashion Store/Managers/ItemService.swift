//
//  ItemService.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 30.03.24.
//

import Foundation
import Firebase

enum ItemError: Error {
    case failedToGetData
}

class ItemService {
    
    static let shared = ItemService()
    
    public func fetchAllItems(completion: @escaping (Result<[Item], Error>) -> Void) {
        let db = Firestore.firestore()
        db.collection("items").getDocuments { snapshot, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let snapshot = snapshot else {
                completion(.failure(ItemError.failedToGetData))
                return
            }
            var items: [Item] = []
            for document in snapshot.documents {
                let data = document.data()
                
                if let item = Item(id: document.documentID, dictionary: data) {
                    items.append(item)
                }
            }
            completion(.success(items))
        }
    }
    
    //
    //    public func fetchItem(itemId: String, completion: @escaping (Result<Item, Error>) -> Void) {
    //
    //        let db = Firestore.firestore()
    //
    //        db.collection("items")
    //            .document(itemId)
    //            .getDocument { snapshot, error in
    //                if error != nil {
    //                    completion(.failure(ItemError.failedToGetData))
    //                    return
    //                }
    //
    //                if let snapshot = snapshot {
    //
    //                    let id = snapshot.documentID
    //                    let title = snapshot["title"] as? String ?? "no"
    //                    let price = snapshot["price"] as? Float ?? 0.0
    //                    let p = String(price)
    //                    let i = snapshot["imageURL"] as? String ?? "x"
    ////                    let item = Item(dictionary: <#[String : Any]#>, id: id, title: title, price: String(p), imageURL: i)
    ////                    completion(.success(item))
    //                }
    //            }
    //
    //
    //    }
    //
    
    
    
    
}

