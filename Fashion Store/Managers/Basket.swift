//
//  Basket.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 25.03.24.
//

import Foundation

class Basket {
    
    static var shared = Basket()
    
    private var basketItems: [BasketItem] = []
    
    public func addItem(basketItem: BasketItem) {
        basketItems.append(basketItem)
        //loadItems()
    }
    
    public func loadItems() -> [Item] {
        var items: [Item] = []
        basketItems.forEach { basketItem in
//            ItemService().fetchItem(itemId: basketItem.id) { result in
//                switch result {
//                case .success(let item):
//                    items.append(item)
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            }
        }
        return items
    }
    
    func calculateTotal() {
        ///let total = 0
//        basketItems.forEach { basketItem in
//            //
//        }
    }
    
    
}
