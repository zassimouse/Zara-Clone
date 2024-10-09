import UIKit

class CustomSheetPresentationController: UISheetPresentationController, UIViewControllerTransitioningDelegate {
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        guard let presentedView = presentedView else { return }
        
        // Set the frame of the presented view
        presentedView.frame = CGRect(
            x: 0,
            y: presentingViewController.view.bounds.height - preferredContentSize.height,
            width: presentingViewController.view.bounds.width,
            height: preferredContentSize.height
        )
    }
    
}
