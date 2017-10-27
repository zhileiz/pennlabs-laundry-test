//
//  HallsViewController.swift
//  LaundryTester
//
//  Created by Zhilei Zheng on 2017/10/24.
//  Copyright © 2017年 Zhilei Zheng. All rights reserved.
//

import UIKit

class HallsViewController: UIViewController {
    
    var srcVC:ViewController?
    
    var hallsDict:[(Int,String)] = [
        (0, "Bishop White"),
        (1, "Chestnut Butcher"),
        (2, "Class of 1928 Fisher"),
        (3, "Craig"),
        (4, "DuBois"),
        (5, "English House"),
        (6, "Harnwell Floor 02"),
        (7, "Harnwell Floor 04"),
        (8, "Harnwell Floor 06"),
        (9, "Harnwell Floor 08"),
        (10, "Harnwell Floor 10"),
        (11, "Harnwell Floor 12"),
        (12, "Harnwell Floor 14"),
        (13, "Harnwell Floor 16"),
        (14, "Harnwell Floor 18"),
        (15, "Harnwell Floor 20"),
        (16, "Harnwell Floor 22"),
        (17, "Harnwell Floor 24"),
        (18, "Harrison Floor 04"),
        (19, "Harrison Floor 06"),
        (20, "Harrison Floor 08"),
        (21, "Harrison Floor 10"),
        (22, "Harrison Floor 12"),
        (23, "Harrison Floor 14"),
        (24, "Harrison Floor 16"),
        (25, "Harrison Floor 18"),
        (26, "Harrison Floor 20"),
        (27, "Harrison Floor 22"),
        (28, "Harrison Floor 24"),
        (29, "Hill House"),
        (30, "Magee Amhurst"),
        (31, "Mayer"),
        (32, "Morgan"),
        (33, "Rodin Floor 02"),
        (34, "Rodin Floor 04"),
        (35, "Rodin Floor 06"),
        (36, "Rodin Floor 08"),
        (37, "Rodin Floor 10"),
        (38, "Rodin Floor 12"),
        (39, "Rodin Floor 14"),
        (40, "Rodin Floor 16"),
        (41, "Rodin Floor 18"),
        (42, "Rodin Floor 20"),
        (43, "Rodin Floor 22"),
        (44, "Rodin Floor 24"),
        (45, "Sansom East"),
        (46, "Sansom West"),
        (47, "Stouffer Commons"),
    ]

    @IBOutlet weak var hallsList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        hallsList.delegate = self
        hallsList.dataSource = self
    }

}

extension HallsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hallsDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "hallCell") as? HallViewCell{
            let tuple = hallsDict[indexPath.row]
            cell.setUp(name: tuple.1)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected \(indexPath.row)")
        srcVC?.addHall(id: indexPath.row)
        navigationController?.popViewController(animated: true);
    }
    
    
}

