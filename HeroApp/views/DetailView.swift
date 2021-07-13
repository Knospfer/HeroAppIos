//
//  DetailView.swift
//  HeroApp
//
//  Created by Riccardo Cipolleschi on 13/07/21.
//

import UIKit

// SSUL
// Setup
// Style
// Update
// Layout



struct DetailViewModel: Equatable {
  let heroName: String
}

class DetailView: UIView {
  let titleLabel = UILabel()
  var actionButton = ActionButton()

  var viewModel: DetailViewModel? {
    didSet {
      self.update(oldModel: oldValue)
    }
  }

  var userDidTapActionButton: (() -> Void)?

  override init(frame: CGRect) {
    super.init(frame: frame)

    self.setup()
    self.style()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setup() {
    self.addSubview(self.titleLabel)
    self.addSubview(self.actionButton)
    self.actionButton.addTarget(self, action: #selector(actionButtonTapped(_:)), for: .touchUpInside)
  }

  @objc func actionButtonTapped(_ sender: UIButton) {
    self.userDidTapActionButton?()
  }

  func style() {
    titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    Style.styleActionButton(actionButton)
  }

  func update(oldModel: DetailViewModel?) {
    titleLabel.text = self.viewModel?.heroName ?? ""
    self.setNeedsLayout()
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    self.titleLabel.center = self.center
  }
}

enum Style {
  static func styleActionButton(_ button: UIButton) {
    // styling
    
  }
}

class ActionButton: UIButton {
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.style()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func style() {

  }
}
