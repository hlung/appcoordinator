import UIKit

protocol PurchaseCoordinatorDelegate: AnyObject {
  func purchaseCoordinatorDidPurchase(_ coordinator: PurchaseCoordinator)
  func purchaseCoordinatorDidCancel(_ coordinator: PurchaseCoordinator)
}

/// An example of a coordinator that manages an operation involving a series of UIAlertController.
final class PurchaseCoordinator: Coordinator {
  var window: UIWindow

  weak var delegate: PurchaseCoordinatorDelegate?

  init(window: UIWindow) {
    print("\(type(of: self)) \(#function)")
    self.window = window
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  deinit {
    print("\(type(of: self)) \(#function)")
  }

  func start() {
    self.window.rootViewController?.present(purchaseAlertController(), animated: true)
  }

  // MARK: - Alert Controllers

  func purchaseAlertController() -> UIAlertController {
    let alert = UIAlertController(title: "Purchase flow", message: "Do you want to purchase?", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
      self.delegate?.purchaseCoordinatorDidCancel(self)
    }))
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
      self.window.rootViewController?.present(self.confirmationAlertController(), animated: true)
    }))
    return alert
  }

  func confirmationAlertController() -> UIAlertController {
    let alert = UIAlertController(title: "Purchase flow", message: "Confirm purchase?", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
      self.delegate?.purchaseCoordinatorDidCancel(self)
    }))
    alert.addAction(UIAlertAction(title: "Yes!", style: .default, handler: { _ in
      self.delegate?.purchaseCoordinatorDidPurchase(self)
    }))
    return alert
  }

}
