import UIKit

final public class Bullseye {
    let constraint: NSLayoutConstraint
    let view: UIView

    public var enablePrioritiesBlock: (() -> Void)?
    public var disablePrioritiesBlock: (() -> Void)?

    public init(constraint: NSLayoutConstraint, view: UIView) {
        self.constraint = constraint
        self.view = view
    }

    @objc public func didChangeValue(sender: UISlider) {
        constraint.constant = CGFloat(sender.value)
        updateLayout()

    }

    @objc public func didChangeSelection(sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            disablePrioritiesBlock?()
        } else {
            enablePrioritiesBlock?()
        }
        updateLayout()
    }

    func updateLayout() {
        view.setNeedsLayout()
//        print(view.perform(NSSelectorFromString("_autolayoutTrace")))
    }
}
