//
//  ViewController.swift
//  LaundryTester
//
//  Created by Zhilei Zheng on 2017/10/24.
//  Copyright © 2017年 Zhilei Zheng. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var selectedList: UITableView!
    var halls:[LaundryHall] = [] //at most 2

    @IBAction func allHalls(_ sender: Any) {
        performSegue(withIdentifier: "addHalls", sender: sender)
    }
    @IBAction func refreshHalls(_ sender: Any) {
        updateInfo()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedList.delegate = self
        selectedList.dataSource = self
    }
    
    func updateInfo(){
        if halls.count == 2 {
            LaundryAPIService.instance.getHalls(for: halls[0].id, id2: halls[1].id) { (laundryHall1, laundryHall2) in
                if let hall1 = laundryHall1 {
                    self.halls[0] = hall1
                } else {
                    print("Failed To Update 1")
                }
                if let hall2 = laundryHall1 {
                    self.halls[1] = hall2
                } else {
                    print("Failed To Update 2")
                }
                self.selectedList.reloadData()
            }
        } else if halls.count == 1 {
            LaundryAPIService.instance.getHall(for: halls[0].id) { (laundryHall) in
                if let hall = laundryHall {
                    self.halls[0] = hall
                } else {
                    print("Failed To Update 1")
                }
                self.selectedList.reloadData()
            }
        }
    }
    
}

extension ViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return halls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell") as? InfoViewCell{
            let currHall = halls[indexPath.row]
            cell.setUpViewFor(hall:currHall)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}
// Interaction with all Halls
extension ViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addHalls"){
            if let toAllHalls = segue.destination as? HallsViewController {
                toAllHalls.srcVC = self
            }
        }
    }
    
    func addHall(id:Int){
        if halls.count < 2{
            LaundryAPIService.instance.getHall(for: id) { (laundryHall) in
                if let hall = laundryHall {
                    self.halls.append(hall)
                } else {
                    print("Failed To Update 1")
                }
                self.selectedList.reloadData()
            }
        }
    }
}

