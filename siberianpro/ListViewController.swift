//
//  ViewController.swift
//  siberianpro
//
//  Created by ndolgopolov on 22.08.17.
//  Copyright © 2017 ndolgopolov. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel : ListViewModel = ListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ItemViewCell", bundle: nil), forCellReuseIdentifier: "item")
        tableView.register(UINib(nibName: "GroupViewCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "group")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showAlertWith(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKaction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertVC.addAction(OKaction)
        self.present(alertVC, animated: true, completion: nil)
    }

}


extension ListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.listArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listArray[section].itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item") as! ItemViewCell
        cell.setUI(item: viewModel.listArray[indexPath.section].itemArray[indexPath.row])
        cell.delegate = self
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.ItemCellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.GroupHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "group") as! GroupViewCell
        view.setUI(group: viewModel.listArray[section])
        view.delegate = self
        view.index = section
        return view
    }
    
}

extension ListViewController: ItemViewCellDelegate {
    func longPressAction(cell: ItemViewCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            let title = viewModel.listArray[indexPath.section].title
            let message = viewModel.listArray[indexPath.section].itemArray[indexPath.row].title
            showAlertWith(title:title, message: message)
        }
    }
}

extension ListViewController: GroupViewCellDelegate {
    func longPressAction(even: Bool) {
        animateTable(targetView: self.tableView, duration: 1.0, direction: even ? 1.0 : -1.0)
    }
    
    func animateTable(targetView: UIView, duration: Double, direction: Double) {
        
        targetView.rotateView(duration:duration, direction: direction)
    }
}
