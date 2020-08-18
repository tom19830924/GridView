//
//  ViewController.swift
//  GridView
//
//  Created by Tom on 2020/8/18.
//

import UIKit

class ViewController: UIViewController {
    var columns = 4
    var rows = 3
    
    lazy var gridView: GridView = {
        let gridView = GridView(columns: columns, rows: rows)
        gridView.translatesAutoresizingMaskIntoConstraints = false
        return gridView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(gridView)

        gridView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        gridView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        gridView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        gridView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        
        Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { [weak self] (timer) in
            guard let self = self else { return }
            let column = Int(arc4random() % UInt32(self.columns))
            let row = Int(arc4random() % UInt32(self.rows))
            self.gridView.selectItem(column: column, row: row)
        }
    }
}

