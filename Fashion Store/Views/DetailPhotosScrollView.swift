//
//  DetailPhotosScrollView.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 25.03.24.
//

import UIKit

class DetailPhotosScrollView: UIScrollView {

    struct FakePhoto {
        
        let id = UUID().uuidString
        var imageURLString = "https://firebasestorage.googleapis.com/v0/b/fashion-store-80202.appspot.com/o/04087454251-e1.jpeg?alt=media&token=52f8907b-ad07-41fd-ab0b-177a0f704db3"
    }
    
    let photos = [FakePhoto(), FakePhoto(), FakePhoto(), FakePhoto(), FakePhoto(), FakePhoto(), FakePhoto()]
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(UIImageView(image: UIImage(named: "1")))
        addSubview(UIImageView(image: UIImage(named: "2")))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
