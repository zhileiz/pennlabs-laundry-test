//
//  HallViewCell.swift
//  LaundryTester
//
//  Created by Zhilei Zheng on 2017/10/24.
//  Copyright © 2017年 Zhilei Zheng. All rights reserved.
//

import UIKit
import SnapKit

class HallViewCell: UITableViewCell {
    
    
    var hallName:UILabel = UILabel()
    
    func setUp(name:String){
        self.addSubview(hallName)
        hallName.text = name
        hallName.snp.makeConstraints{(make) -> Void in
            make.center.equalTo(self)
        }
    }    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
