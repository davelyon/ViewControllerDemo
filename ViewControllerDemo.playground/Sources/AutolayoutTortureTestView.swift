import UIKit

public struct AutolayoutPriorityTestConfiguration {
    public let minHeight: Double
    public let maxHeight: Double
    public let containerWidth: Double

    public init(minHeight: Double, maxHeight: Double, containerWidth: Double) {
        self.minHeight = minHeight
        self.maxHeight = maxHeight
        self.containerWidth = containerWidth
    }
}

public final class AutolayoutTortureTestView: UIView {
    let slider = UISlider(frame: .zero)
    let picker = UISegmentedControl(items: ["Disabled", "Enabled"])
    var controllableHeightConstraint: NSLayoutConstraint!

    let configuration: AutolayoutPriorityTestConfiguration

    public var target: Bullseye!

    public init(view: UIView, configuration: AutolayoutPriorityTestConfiguration) {
        self.configuration = configuration

        super.init(frame: CGRect(x: 0, y: 0, width: configuration.containerWidth, height: configuration.maxHeight + 100))

        backgroundColor = #colorLiteral(red: 0.7602152824, green: 0.7601925135, blue: 0.7602053881, alpha: 1)
        addSubview(view)

        controllableHeightConstraint = view.heightAnchor.constraint(equalToConstant: CGFloat(configuration.maxHeight - 100.0))

        // Configure Slider
        slider.translatesAutoresizingMaskIntoConstraints = false
        addSubview(slider)
        slider.isContinuous = true
        slider.maximumValue = Float(configuration.maxHeight)
        slider.minimumValue = Float(configuration.minHeight)

        slider.value = Float(controllableHeightConstraint.constant)

        // Picker configuration
        picker.translatesAutoresizingMaskIntoConstraints = false
        addSubview(picker)
        picker.selectedSegmentIndex = 0

        NSLayoutConstraint.activate([

            view.topAnchor.constraint(equalTo: topAnchor),
            controllableHeightConstraint,
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),

            slider.bottomAnchor.constraint(equalTo: picker.topAnchor, constant: -12),
            slider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            slider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),

            picker.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            picker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            picker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
        ])

        target = Bullseye(constraint: controllableHeightConstraint, view: self)
        slider.addTarget(target, action: #selector(Bullseye.didChangeValue(sender:)), for: .valueChanged)
        picker.addTarget(target, action: #selector(Bullseye.didChangeSelection(sender:)), for: .valueChanged)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

