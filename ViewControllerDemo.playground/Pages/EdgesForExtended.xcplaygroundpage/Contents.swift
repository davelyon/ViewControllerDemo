//: [Previous](@previous)

import UIKit
import PlaygroundSupport

enum ExampleCase {
    case `default`
    case stuckUnderTopAndBottom
    case stuckUnderTopBar
    case onlyBottomBar
}

let transluscent = true
let currentExample: ExampleCase = .onlyBottomBar

class ExampleTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        switch currentExample {

        case .default:
            break

        case .stuckUnderTopAndBottom:
            automaticallyAdjustsScrollViewInsets = false
            edgesForExtendedLayout = [.top, .bottom]

        case .stuckUnderTopBar:
            automaticallyAdjustsScrollViewInsets = false
            edgesForExtendedLayout = [.top]

        case .onlyBottomBar:
            automaticallyAdjustsScrollViewInsets = true
            edgesForExtendedLayout = [.bottom]
        }

        if transluscent {
            extendedLayoutIncludesOpaqueBars = true
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        if indexPath.row == 0 { cell.backgroundColor = .red }
        else if indexPath.row == 7 { cell.backgroundColor = .blue }
        else { cell.backgroundColor = .white }

        return cell
    }
}

let tabBarController = UITabBarController(nibName: nil, bundle: nil)
let navigationController = UINavigationController(rootViewController: ExampleTableViewController(style: .plain))

tabBarController.tabBar.isTranslucent = transluscent
navigationController.navigationBar.isTranslucent = transluscent

tabBarController.viewControllers = [navigationController]

PlaygroundPage.current.liveView = tabBarController


//: [Next](@next)
