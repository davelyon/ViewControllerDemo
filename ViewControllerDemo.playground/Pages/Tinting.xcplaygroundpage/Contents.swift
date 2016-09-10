//: [Previous](@previous)

import UIKit
import PlaygroundSupport

class SmarterCustomButton: UIButton {
    override func tintColorDidChange() {
        super.tintColorDidChange()
        setTitleColor(tintColor, for: .normal)
    }
}

// Change this to `SmarterCustomButton` to see tintAdjustment working as expected.
typealias ButtonType = UIButton

class CustomViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.bookmarks, tag: 9)

        // A default, system icon
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)

        // Our own custom label with a text color

        let customButton = ButtonType(type: .custom)
        customButton.setTitle("Do Thing", for: .normal)
        customButton.setTitleColor(customButton.tintColor, for: .normal)
        customButton.sizeToFit()
        customButton.addTarget(self, action: #selector(goBright), for: .touchUpInside)

        let customItem = UIBarButtonItem(customView: customButton)
        navigationItem.leftBarButtonItem = customItem
    }

    required init(coder aDecoder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let button = ButtonType(type: .custom)
        view.addSubview(button)

        button.setTitle("Go Dark", for: .normal)
        button.setTitleColor(view.tintColor, for: .normal)

        button.addTarget(self, action: #selector(goDark), for: .touchUpInside)

        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    func goDark() {
        tabBarController?.view.tintAdjustmentMode = .dimmed
    }

    func goBright() {
        tabBarController?.view.tintAdjustmentMode = .automatic
    }
}

class CustomTabBarController: UITabBarController {
    init() {
        super.init(nibName: nil, bundle: nil)
        viewControllers = [
            UINavigationController(rootViewController:  CustomViewController())
        ]
    }

    required init(coder aDecoder: NSCoder) {
        fatalError()
    }
}

PlaygroundPage.current.liveView  = CustomTabBarController()

//: [Next](@next)
