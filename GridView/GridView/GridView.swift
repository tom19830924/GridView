//
//  GridView.swift
//  TEST
//
//  Created by Tom on 2020/8/17.
//

import UIKit


class GridView: UIView {
    private let numberOfColumns: Int
    private let numberOfRow: Int
    private var selectedVerticalView: VerticalView?
    private var selectedView: LabelView?
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 3
        return stackView
    }()
    
    init(columns: Int, rows: Int) {
        self.numberOfColumns = columns
        self.numberOfRow = rows
        
        super.init(frame: .zero)
        
        self.addSubview(horizontalStackView)
        self.topAnchor.constraint(equalTo: horizontalStackView.topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: horizontalStackView.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: horizontalStackView.trailingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: horizontalStackView.bottomAnchor).isActive = true

        for _ in 0..<columns {
            let verticalView = createVerticalView()
            horizontalStackView.addArrangedSubview(verticalView)
        }
    }
    
    func selectItem(column: Int, row: Int) {
        clearSelection()
        
        for (c, vView) in horizontalStackView.arrangedSubviews.enumerated() {
            if
                let verticalView = vView as? VerticalView,
                c == column {
                    verticalView.button.isSelected = true
                    verticalView.button.isUserInteractionEnabled = true
                    verticalView.layer.borderColor = UIColor.red.cgColor
                    verticalView.layer.borderWidth = 3
                    selectedVerticalView = verticalView
                    
                    for (r, lView) in verticalView.stackView.arrangedSubviews.enumerated() {
                        if
                            let labelView = lView as? LabelView,
                            r == row {
                                labelView.label.text = "random"
                                selectedView = labelView
                                return
                        }
                    }
            }
        }
    }
    
    private func clearSelection() {
        selectedVerticalView?.layer.borderColor = nil
        selectedVerticalView?.layer.borderWidth = 0
        selectedVerticalView?.button.isSelected = false
        selectedVerticalView?.button.isUserInteractionEnabled = false
        
        selectedView?.label.text = nil
    }
        
    private func createVerticalView() -> VerticalView {
        let verticalView = VerticalView(numberOfRows: numberOfRow)
        verticalView.delegate = self
        verticalView.translatesAutoresizingMaskIntoConstraints = false
        verticalView.backgroundColor = .clear
        verticalView.layer.cornerRadius = 3
        return verticalView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("GridView deinit")
    }
}

extension GridView: VerticalViewDelegate {
    func clearButtonPressed() {
        clearSelection()
    }
}
