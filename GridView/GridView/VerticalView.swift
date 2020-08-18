//
//  VerticalView.swift
//  TEST
//
//  Created by Tom on 2020/8/18.
//

import UIKit

protocol VerticalViewDelegate: class {
    func clearButtonPressed()
}
class VerticalView: UIView {
    weak var delegate: VerticalViewDelegate?
    
    lazy var button: DesignableButton = {
        let btn = DesignableButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("確定", for: .normal)
        btn.setTitleColor(.lightGray, for: .normal)
        btn.setTitleColor(.white, for: .selected)
        btn.cornerRadius = 3
        btn.borderWidth = 1
        btn.borderColor = .lightGray
        btn.setBackgroundColor(.clear, for: .normal)
        btn.setBackgroundColor(.blue, for: .selected)
        btn.isUserInteractionEnabled = false
        return btn
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        return stackView
    }()
    
    init(numberOfRows: Int) {
        super.init(frame: .zero)
        
        self.addSubview(button)
        button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        self.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -5).isActive = true
        
        for _ in 0..<numberOfRows {
            let v = LabelView(frame: .zero)
            v.backgroundColor = .randomColor()
            stackView.addArrangedSubview(v)
        }
    }
    
    @objc func buttonPressed(_ sender: Any) {
        delegate?.clearButtonPressed()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
