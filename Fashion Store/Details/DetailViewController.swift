//
//  File.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 19.01.25.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    private var detents: [CGFloat] = [150]
    private var currentDetentIndex = 0
    var navHeight: CGFloat = 0
    private let grabberViewHeight: CGFloat = 8
    
//    private var sheetViewTopConstraint: NSLayoutConstraint!

    // MARK: - Subviews
    private lazy var sheetView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true
//        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsVerticalScrollIndicator =  false
        collectionView.bounces = false
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let exitButton = IconButton(buttonType: .exit)
    
    private let shareButton: UIImageView = {
        let image = UIImage(named: "shareIcon")
        let imageView = UIImageView(image: image)
        imageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        imageView.tintColor = .label
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var titleLabel: UILabel!
    private var priceLabel: UILabel!
    private var favouritesIcon: IconButton!
    private var descriptionLabel: UILabel!
    
    
    // MARK: - Lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        hidesBottomBarWhenPushed = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self

        setupUI()
        setupSheet()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        exitButton.addTarget(self , action: #selector(exit), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: exitButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: shareButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let navigationController = navigationController {
            navigationController.view.bringSubviewToFront(navigationController.navigationBar)
         }
    }

    // MARK: - SetupUI
    private func setupSheet() {
//        let largeDetent = view.frame.size.height - (self.navigationController?.navigationBar.frame.maxY ?? 0) + grabberViewHeight
        let largeDetent = view.frame.size.height - navHeight + grabberViewHeight
        detents.append(largeDetent)
        
        
        view.addSubview(sheetView)
        sheetView.frame = CGRect(x: 0, y: view.bounds.height, width: view.bounds.width, height: detents.max() ?? 500)
        
        let indicatorView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: grabberViewHeight))
        indicatorView.backgroundColor = .clear
        sheetView.addSubview(indicatorView)
        
        let grabberView = UIView(frame: CGRect(x: view.center.x - 30, y: 0, width: 60, height: 1))
        grabberView.backgroundColor = .label
        indicatorView.addSubview(grabberView)
                
        let height = detents.max() ?? 500
        
        let contentView = UIView(frame: CGRect(x: 0, y: grabberViewHeight, width: view.bounds.width, height: height - grabberViewHeight))
        contentView.backgroundColor = .systemBackground
        sheetView.addSubview(contentView)

        titleLabel = UILabel(frame: CGRect(x: 10, y: 10, width: view.bounds.width - 20, height: 20))
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        titleLabel.text = "LINEN AND LIOCELL ZIP OVERHIRT"
        contentView.addSubview(titleLabel)
        
        priceLabel = UILabel(frame: CGRect(x: 10, y: 30, width: 200, height: 20))
        priceLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        priceLabel.text = "269,00 BYN"
        contentView.addSubview(priceLabel)
        
        favouritesIcon = IconButton(buttonType: .bookmark)
        favouritesIcon.frame = CGRect(x: view.bounds.width - 50, y: 60, width: 40, height: 30)
        favouritesIcon.layer.borderWidth = 0.5
        favouritesIcon.layer.borderColor = UIColor.label.cgColor
        contentView.addSubview(favouritesIcon)
        
        let text = UITextView(frame: CGRect(x: 10, y: 160, width: view.bounds.width - 20, height: 200))
        text.text = "Regular fit jacket made of water-repellent technical fabric, fleece-lined interior. High neck and long sleeves wit h elasticated cuffs. Flap pockets at the hips and an inside pocket detail. Elasticated hem. Front zip fastening concealed by a placket with snap buttons."
        text.textContainer.lineFragmentPadding = 0
        text.textAlignment = .left
        text.clipsToBounds = true
        text.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        contentView.addSubview(text)
        
        let label = UILabel(frame: CGRect(x: 10, y: 160 + 10 + text.contentSize.height, width: 200, height: 20))
        label.text = "Green | 090/322/767"
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        contentView.addSubview(label)

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        panGesture.cancelsTouchesInView = false

        sheetView.addGestureRecognizer(panGesture)
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        collectionView.frame = self.view.bounds
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateSheetPosition(animated: false)
    }
    
    // MARK: - Methods
    
    // MARK: - Selectors
    @objc private func exit() {
        let transition = CATransition()
        transition.duration = 0.33
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        transition.type = .moveIn
        transition.subtype = .fromBottom
        navigationController?.view.layer.add(transition, forKey: kCATransition)
        
        navigationController?.popViewController(animated: false)
    }

    @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        let velocity = gesture.velocity(in: view)

        switch gesture.state {
        case .changed:
            print("changed")
            var newY = max(sheetView.frame.origin.y + translation.y, view.bounds.height - (detents.max() ?? 500))
//            let newY = max(view.bounds.height + translation.y, view.bounds.height - (detents.max() ?? 500))
            if newY > view.bounds.height - 150 {
                newY = view.bounds.height - 150
            }
            print(newY)
            sheetView.frame.origin.y = newY
            gesture.setTranslation(.zero, in: view)
        case .ended:
            let targetIndex: Int
            if velocity.y > 0 {
                targetIndex = max(currentDetentIndex - 1, 0)
            } else {
                targetIndex = min(currentDetentIndex + 1, detents.count - 1)
            }
            currentDetentIndex = targetIndex
            updateSheetPosition(animated: true)
        default:
            break
        }
    }

    private func updateSheetPosition(animated: Bool) {
        let targetY = view.bounds.height - detents[currentDetentIndex]
        print("current detent \(detents[currentDetentIndex])")
        if animated {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.6, options: [.curveEaseOut]) {
                self.sheetView.frame.origin.y = targetY
                print("targetY: \(targetY)")
            }
        } else {
            sheetView.frame.origin.y = targetY
        }
    }
    
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as? ImageCell else {
            return UICollectionViewCell()
        }
//        cell.configure(with: "hi")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.width / 2 * 3
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let width = UIScreen.main.bounds.size.width
        return CGSize(width: width, height: 300)
    }
}

class ImageCell: UICollectionViewCell {
    static let identifier = String(describing: ImageCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .random()
        
        let image = UIImage(named: "i1")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame = bounds
        self.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with suggestion: String) {
        
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red:   .random(in: 0...1),
           green: .random(in: 0...1),
           blue:  .random(in: 0...1),
           alpha: 1.0
        )
    }
}

