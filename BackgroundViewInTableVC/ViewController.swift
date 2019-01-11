//
//  ViewController.swift
//  BackgroundViewInTableVC
//
//  Created by kashee on 11/01/19.
//  Copyright © 2019 kashee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableItems = [String]()

    lazy var tableView:UITableView = {
        let tv = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        tv.delegate = self
        tv.dataSource = self
        tv.estimatedRowHeight = 100
        tv.rowHeight = UITableViewAutomaticDimension
        tv.separatorStyle = .none
        tv.contentInset = UIEdgeInsets.zero
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.fillSuperview(padding: .init(top: 60, left: 0, bottom: 20, right: 0))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if (tableItems.count) > 0{
            tableView.backgroundView = nil
           return 1
        }else{
            
            let width = UIScreen.main.bounds.width
            let height = UIScreen.main.bounds.height
            
            let frame = CGRect(x: 0, y: 0, width: width, height: height - 80)
            let backgroundView = BackgroundView(frame: frame)
            tableView.backgroundView = backgroundView
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        if (tableItems.count) > 0{
            let status = tableItems[indexPath.row]
            cell.textLabel?.text = status
        }
        return cell
    }


}

