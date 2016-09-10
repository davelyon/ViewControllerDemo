import UIKit
import PlaygroundSupport

extension UILayoutPriority {
    public static let required: Float    = UILayoutPriorityRequired
    public static let high: Float        = UILayoutPriorityDefaultHigh
    public static let low: Float         = UILayoutPriorityDefaultLow
    public static let fittingSize: Float = UILayoutPriorityFittingSizeLevel
}

extension UIView {
    var verticalCompressionResistance: UILayoutPriority {
        get { return contentCompressionResistancePriority(for: .vertical) }
        set { setContentCompressionResistancePriority(newValue, for: .vertical) }
    }
    var horizontalCompressionResistance: UILayoutPriority {
        get { return contentCompressionResistancePriority(for: .horizontal) }
        set { setContentCompressionResistancePriority(newValue, for: .horizontal) }
    }
    var verticalContentHuggingPriority: UILayoutPriority {
        get { return contentHuggingPriority(for: .vertical) }
        set { setContentHuggingPriority(newValue, for: .vertical) }
    }
    var horizontalContentHuggingPriority: UILayoutPriority {
        get { return contentHuggingPriority(for: .horizontal) }
        set { setContentHuggingPriority(newValue, for: .horizontal) }
    }
}

var articleView = ArticleView(frame: .zero)

func makeTarget(articleView: ArticleView) -> AutolayoutTortureTestView {
    let maxHeight = 800.0
    let minHeight = 300.0
    let containerWidth = 500.0

    let configuration = AutolayoutPriorityTestConfiguration(minHeight: minHeight, maxHeight: maxHeight, containerWidth: containerWidth)
    let testerView = AutolayoutTortureTestView(view: articleView, configuration: configuration)
    return testerView
}

let view = makeTarget(articleView: articleView)

view.target!.enablePrioritiesBlock = {

    articleView.headlineLabel.verticalCompressionResistance = .high
    articleView.contentLabel.verticalCompressionResistance  = .low
    articleView.bylineLabel.verticalCompressionResistance   = .high
    articleView.actionButton.verticalCompressionResistance  = .required

    articleView.headlineLabel.verticalContentHuggingPriority    = .required
    articleView.contentLabel.verticalContentHuggingPriority     = .low
    articleView.bylineLabel.verticalContentHuggingPriority      = .high
    articleView.actionButton.verticalContentHuggingPriority     = .required
}

view.target!.disablePrioritiesBlock = {
    [articleView.headlineLabel,
     articleView.contentLabel,
     articleView.bylineLabel,
     articleView.actionButton]
     .forEach { view in
        view.verticalCompressionResistance = .high
        view.verticalContentHuggingPriority = .low
    }
}

PlaygroundPage.current.liveView = view


//: [Next](@next)
