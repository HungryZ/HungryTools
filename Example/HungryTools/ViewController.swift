//
//  ViewController.swift
//  HungryTools
//
//  Created by zhanghaichuan on 03/05/2021.
//  Copyright (c) 2021 zhanghaichuan. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let dataArray = ["CountingButton"]
    
    lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "HungryTools"
        view.backgroundColor = .white
        
        view.addSubview(mainTableView)
        mainTableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC: UIViewController?
        switch dataArray[indexPath.row] {
        case "CountingButton":
            nextVC = CountingButtonController()
        default:
            nextVC = nil
        }
        if let vc = nextVC {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
