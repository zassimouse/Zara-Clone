import UIKit

class TopTabBarController: UIViewController {
    
    var viewControllers: [UIViewController] = []
    
    private let backButton = IconButton(buttonType: .exit)
    
    var showBasketButton = BorderedButton(title: "SHOPPING BAG")
    var showFavouritesButton = BorderedButton(title: "FAVOURITES")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        showBasketButton.addTarget(self, action: #selector(showBasket), for: .touchUpInside)
        showFavouritesButton.addTarget(self, action: #selector(showFavourites), for: .touchUpInside)
        
        let firstVC = BasketViewController()
        let secondVC = FavouritesViewController()
        
        viewControllers = [firstVC, secondVC]
        
        displayViewController(index: 0)
        showBasketButton.setBold()
    }
    
    
    
    @objc func showBasket() {
        showBasketButton.setBold()
        showFavouritesButton.unsetBold()
        displayViewController(index: 0)
    }
    
    @objc func showFavourites() {
        showBasketButton.unsetBold()
        showFavouritesButton.setBold()
        displayViewController(index: 1)
    }

    
    func displayViewController(index: Int) {
        let selectedVC = viewControllers[index]
        
        // Remove current child view controllers
        children.forEach { $0.willMove(toParent: nil); $0.view.removeFromSuperview(); $0.removeFromParent() }
        
        // Add the selected view controller as child
        addChild(selectedVC)
        selectedVC.view.frame = view.bounds
        selectedVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(selectedVC.view)
        view.sendSubviewToBack(selectedVC.view)
        selectedVC.didMove(toParent: self)
        
        view.addSubview(showBasketButton)
        view.addSubview(showFavouritesButton)
        
        // Adjust constraints to fit below the tab bar
        NSLayoutConstraint.activate([
            showBasketButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            showBasketButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -1),
            showBasketButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 1),
            showBasketButton.heightAnchor.constraint(equalToConstant: 40),
            
            showFavouritesButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            showFavouritesButton.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            showFavouritesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 1),
            showFavouritesButton.heightAnchor.constraint(equalToConstant: 40),
            
            selectedVC.view.topAnchor.constraint(equalTo: showBasketButton.bottomAnchor),
            selectedVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            selectedVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            selectedVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
