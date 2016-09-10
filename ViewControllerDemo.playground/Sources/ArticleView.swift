import UIKit

public final class ArticleView: UIView {

    public let headlineLabel = UILabel()
    public let contentLabel = UILabel()
    public let bylineLabel = UILabel()
    public let actionButton = UIButton(type: .system)

    let stackView: UIStackView

    private var wrappingConstraints: [NSLayoutConstraint]?

    public override init(frame: CGRect) {
        stackView = UIStackView()

        super.init(frame: frame)

        //backgroundColor = #colorLiteral(red: 0.9166661501, green: 0.4121252298, blue: 0.2839399874, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false

        // The headline of the article, should span multiple lines
        headlineLabel.backgroundColor = .white
        headlineLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        headlineLabel.textColor = .black
        headlineLabel.numberOfLines = 0
        headlineLabel.lineBreakMode = .byTruncatingTail
        headlineLabel.text = "This just in, lorem ipsum dolor sit amet. You won't believe what happens next!"

        // The article content, should be truncated to make room as this is a summary view, not a detail view
        contentLabel.backgroundColor = .white
        contentLabel.font = UIFont.preferredFont(forTextStyle: .body)
        contentLabel.textColor = .black
        contentLabel.numberOfLines = 0
        contentLabel.lineBreakMode = .byTruncatingTail
        contentLabel.text = "Posuere adipiscing vulputate suspendisse ultricies porttitor suspendisse natoque a porta ad facilisis non sociis semper consequat ullamcorper auctor nisi senectus. Phasellus blandit convallis at ad elit ac sit a fames euismod duis pretium lacinia mus adipiscing. Parturient luctus magnis primis diam pulvinar senectus suspendisse ullamcorper adipiscing parturient libero etiam ridiculus at. Habitasse erat sed tellus lobortis congue scelerisque vestibulum dignissim semper vulputate suspendisse a maecenas mi non semper gravida pretium a condimentum parturient lectus. Vestibulum primis suspendisse sit condimentum suspendisse interdum ullamcorper consectetur condimentum scelerisque adipiscing nibh metus parturient auctor adipiscing lacinia leo adipiscing lobortis dictum id a. Adipiscing feugiat auctor porttitor a ut scelerisque fermentum ullamcorper sem a cum cubilia cum a commodo blandit faucibus lacus suspendisse curae nec vulputate ad lobortis."

        // The byline, very critical and must always be seen!
        bylineLabel.backgroundColor = .white
        bylineLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        bylineLabel.textColor = .black
        bylineLabel.numberOfLines = 1
        bylineLabel.lineBreakMode = .byTruncatingTail
        bylineLabel.text = "By: A. User, On: January 1st 1970"

        actionButton.setTitle("See the whole story", for: .normal)
        actionButton.setTitleColor(.white, for: .normal)
        actionButton.backgroundColor = .black
        actionButton.heightAnchor.constraint(equalToConstant: 64).isActive = true

        [headlineLabel, contentLabel, bylineLabel, actionButton].forEach { stackView.addArrangedSubview($0) }

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 16
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsetsMake(8, 8, 8, 8)
        
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
