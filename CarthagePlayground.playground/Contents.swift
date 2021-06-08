
//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import SnapKit


final class MessageComponentView: UIView {

    typealias ActionClosure = (MessageComponentView) -> Void

    struct Action {
        let title: NSAttributedString
        let action: ActionClosure
    }

    struct Style {
        let tint: UIColor
        let backgroundColor: UIColor
        let iconImage: UIImage?
    }

    struct ViewModel {
        let titleText: NSAttributedString
        let bodyText: NSAttributedString?
        let contentImage: UIImage?
        let action: Action?
        let style: Style
    }

    private let titleLabel = UILabel()
    private let bodyLabel = UILabel()
    private let actionLabel = UILabel()
    private let iconImageView = UIImageView(image: nil)
    private let topStack = UIStackView()
    private let mainStack = UIStackView()

    init(_ viewModel: ViewModel) {
        super.init(frame: .zero)

        self.buildView()
        self.buildLayout()
        self.update(with: viewModel)
    }

    @available(*, unavailable)
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildView() {
        self.topStack.axis = .horizontal
        self.topStack.spacing = 8
        self.titleLabel.textAlignment = .left
        self.titleLabel.numberOfLines = 0

        self.titleLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        // Truncate title label if there isn't enough room
        self.titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        self.titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        // Don't stretch the image
        self.iconImageView.setContentHuggingPriority(.required, for: .horizontal)
        self.iconImageView.setContentHuggingPriority(.required, for: .vertical)
        self.iconImageView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        self.iconImageView.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)

        // Action Label should have highest priority
        self.actionLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        self.actionLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        self.actionLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        self.actionLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)

        self.bodyLabel.numberOfLines = 0

        self.topStack.addArrangedSubview(self.iconImageView)
        self.topStack.addArrangedSubview(self.titleLabel)
        self.topStack.addArrangedSubview(self.actionLabel)

        self.topStack.setContentHuggingPriority(.defaultHigh, for: .vertical)
        self.bodyLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
        self.addSubview(self.mainStack)
        self.mainStack.axis = .vertical
        self.mainStack.addArrangedSubview(self.topStack)
        self.mainStack.addArrangedSubview(self.bodyLabel)

        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1
        self.layer.masksToBounds = true
    }

    private func buildLayout() {
        self.mainStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }

    func update(with viewModel: ViewModel) {
        self.accessibilityLabel = "\(viewModel.titleText.string) \(viewModel.bodyText?.string ?? "")"
        self.titleLabel.attributedText = viewModel.titleText


        if let valueText = viewModel.bodyText {
            self.bodyLabel.isHidden = true
            self.bodyLabel.attributedText = valueText
        } else {
            self.bodyLabel.isHidden = true
            self.bodyLabel.attributedText = NSAttributedString(string: "")
        }

        if let action = viewModel.action {
            self.actionLabel.attributedText = action.title
            self.actionLabel.isHidden = false
        } else {
            self.actionLabel.isHidden = true
        }

        if let iconImage = viewModel.style.iconImage {
            self.iconImageView.image = iconImage
            self.iconImageView.tintColor = viewModel.style.tint
            self.iconImageView.isHidden = false
        } else {

            self.iconImageView.isHidden = true
        }

        if let bodyText = viewModel.bodyText {
            self.bodyLabel.attributedText = bodyText
            self.bodyLabel.isHidden = false
        } else {
            self.bodyLabel.isHidden = true
        }

//        self.addScoredLine(toEdge: .left, color: viewModel.style.tint, inset: .zero, width: .from(gridMultiplier: 1))
//        self.layer.borderColor = viewModel.style.tint.value.cgColor
    }
}


let viewModel = MessageComponentView.ViewModel(titleText: NSAttributedString(string: "Search by school"),
                                               bodyText: NSAttributedString(string: "Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area Enter a school name and we’ll show you all the results in it’s catchment area"),
                                               contentImage: nil,
                                               action: MessageComponentView.Action(title: NSAttributedString(string: "Hide"),
                                                                                   action: {_ in
                                                                                    print("Do something")
                                                                                   }),
                                               style: .init(tint: .blue,
                                                            backgroundColor: .purple,
                                                            iconImage: .checkmark))


let view = MessageComponentView(viewModel)

let vc = UIViewController()
vc.view.frame = CGRect(x: 0, y: 0, width: 375, height: 650)
vc.view.addSubview(view)
vc.preferredContentSize = CGSize(width: 200, height: 300)


view.snp.makeConstraints { make in
    make.edges.equalToSuperview()
}


PlaygroundPage.current.liveView = vc
