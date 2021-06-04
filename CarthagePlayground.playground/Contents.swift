//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import SnapKit

var str = "Hello, playground"

let topStack = UIStackView()

let vc = UIViewController()
vc.view.frame = CGRect(x: 0, y: 0, width: 375, height: 650)
vc.view.addSubview(topStack)
vc.preferredContentSize = CGSize(width: 200, height: 300)

let titleLabel = UILabel()
titleLabel.text = "Title"
let bodyLabel = UILabel()
bodyLabel.text = "bodyLabel"

let actionLabel = UILabel()
actionLabel.text = "actionLabel"

let iconImageView = UIImageView()

titleLabel.textAlignment = .left
titleLabel.numberOfLines = 0
titleLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)

// Truncate title label if there isn't enough room
titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)

iconImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
actionLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)

bodyLabel.numberOfLines = 0

iconImageView.image = .checkmark

topStack.addArrangedSubview(iconImageView)
topStack.addArrangedSubview(titleLabel)
topStack.addArrangedSubview(actionLabel)

topStack.snp.makeConstraints { make in
    make.center.equalToSuperview()
    make.width.lessThanOrEqualTo(100)
}


PlaygroundPage.current.liveView = vc
