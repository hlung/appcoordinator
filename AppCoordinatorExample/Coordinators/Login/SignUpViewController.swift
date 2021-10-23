import UIKit

class SignUpViewController: UIViewController {

  weak var coordinator: LoginNavigationController?

  lazy var button: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("Finish Sign Up", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .systemBlue
    button.setTitleColor(.black, for: .highlighted)
    button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    return button
  }()

  lazy var backButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("Back", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .systemGray
    button.setTitleColor(.black, for: .highlighted)
    button.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "\(type(of: self))"
    view.backgroundColor = .white
    view.addSubview(button)
    view.addSubview(backButton)

    NSLayoutConstraint.activate([
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
      button.widthAnchor.constraint(equalToConstant: 200),

      backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
      backButton.widthAnchor.constraint(equalToConstant: 200),
    ])
  }

  @objc func buttonDidTap() {
    coordinator?.finish(result: "Sign Up")
  }

  @objc func backButtonDidTap() {
    coordinator?.reset()
  }
}

