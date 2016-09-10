//: [Previous](@previous)

import UIKit
import PlaygroundSupport

extension UIView {
    func makeEveryoneFlip() {
        semanticContentAttribute = .forceRightToLeft
        subviews.forEach { $0.makeEveryoneFlip() }
    }
}

class CustomNavigationBar: UINavigationBar {

    override var effectiveUserInterfaceLayoutDirection: UIUserInterfaceLayoutDirection {
        return .rightToLeft
    }

    override func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
        makeEveryoneFlip()
    }
}

class CustomNavigationController: UINavigationController {
    override var traitCollection: UITraitCollection {
        return UITraitCollection(traitsFrom: [super.traitCollection, UITraitCollection(layoutDirection: .rightToLeft)])
    }
}


let arrowImage = #imageLiteral(resourceName: "back-arrow.png").withRenderingMode(.alwaysTemplate)//.imageFlippedForRightToLeftLayoutDirection()
    //Uncomment this to see the image switching direction

class CustomTabBarController: UITabBarController {
    let customNavigationController: CustomNavigationController

    override var traitCollection: UITraitCollection {
        return UITraitCollection(traitsFrom: [super.traitCollection, UITraitCollection(layoutDirection: .rightToLeft)])
    }

    init() {

        customNavigationController = CustomNavigationController(navigationBarClass: CustomNavigationBar.self, toolbarClass: nil)
        customNavigationController.viewControllers = [ CustomViewController() ]

        super.init(nibName: nil, bundle: nil)
        viewControllers = [customNavigationController]
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.makeEveryoneFlip()
    }

    // Note: Add a "Loading Indicator" view that fills around right to left
}

class CustomViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.bookmarks, tag: 9)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let button = UIButton(type: .custom)
        view.addSubview(button)

        button.setTitle("Push Something", for: .normal)
        button.setTitleColor(view.tintColor, for: .normal)

        button.addTarget(self, action: #selector(pushAController), for: .touchUpInside)

        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ])
    }


    func pushAController() {
        let customViewController = CustomViewController()

        let customBackButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goBack))
        customBackButton.image = arrowImage
        customViewController.navigationItem.leftBarButtonItem = customBackButton
        customViewController.navigationItem.hidesBackButton = true

        navigationController?.pushViewController(customViewController, animated: true)
    }

    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}


PlaygroundPage.current.liveView  = CustomTabBarController()

//: [Next](@next)
