//
//  FashionCollectionViewController.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 13.03.24.
//

import UIKit

class HomeViewController: UIViewController, CubeTransitionViewDelegate {

    func pageView(atIndex: Int) -> UIView {
        //let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: transitionView.bounds.size.width, height: transitionView.bounds.size.height))
        
        let imageName = pageData[atIndex]
        let iv = UIImageView(frame: CGRect.init(x: 0, y: 0, width: transitionView.bounds.size.width, height: transitionView.bounds.size.height))
        
        iv.image = UIImage(named: imageName ?? "story6")
        iv.contentMode = .scaleAspectFill
        //iv.scalesLargeContentImage = true //transitionView.bounds.size.width / (iv.image?.size.width ?? 100)
        
        //self.bottomView.clipsToBounds = false
        iv.clipsToBounds = true
        
        return iv
    }
      
      func numberofPages() -> Int {
          return pageData.count
      }
      
      func pageDidChanged(index: Int, direction: Direction) {
          print("index", index)
      }
      
      private var pageData = [Int: String]()
    
      private var transitionView: CubeTransitionInfiniteView = CubeTransitionInfiniteView.init()
      
      override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
          self.initData()
          self.initViews()
      }
      
      override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)   {
            super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        }
      
      required init?(coder: NSCoder) {
            super.init(coder: coder)
      }
      
      func initData() {
          pageData[0] = "story7"
          pageData[1] = "story8"
          pageData[2] = "story9"
          pageData[3] = "story2"
          pageData[4] = "story2"
          pageData[5] = "story6"
      }
 
      func initViews() {
        //let frame: CGRect = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
          
          let guide = self.tabBarController?.tabBar.frame.minY
          print("min taaaaaabbar = \(String(describing: guide))")
          
          let frame: CGRect = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: guide ?? 100)
          
        transitionView = CubeTransitionInfiniteView.init(frame: frame)
          
        transitionView.delegate = self as CubeTransitionViewDelegate
          
        self.view.addSubview(transitionView)
          //setupUI()
        
        transitionView.reloadData();
      }
    
    

    

}
