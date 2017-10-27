//
//  InfoViewCell.swift
//  LaundryTester
//
//  Created by Zhilei Zheng on 2017/10/24.
//  Copyright © 2017年 Zhilei Zheng. All rights reserved.
//

import UIKit

class InfoViewCell: UITableViewCell {
    
    var hallName = UILabel()
    var washersStatus = UILabel()
    var dryersStatus = UILabel()
    var runningDryers = UILabel()
    var runningWashers = UILabel()
    var nextOpenningWasher = UILabel()
    var nextOpenningDryer = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpViewFor(hall: LaundryHall){
        hallName.text = hall.name
        washersStatus.text = hall.getWasherStatus()
        dryersStatus.text = hall.getDryerStatus()
        runningDryers.text = hall.getRunningDryers()
        runningWashers.text = hall.getRunningWashers()
        nextOpenningDryer.text = "Next Dryer Opens in: \(hall.getNextOpenDryer())"
        nextOpenningWasher.text = "Next Washer Opens in: \(hall.getNextOpenWasher())"
        
        self.addSubview(hallName)
        self.addSubview(washersStatus)
        self.addSubview(dryersStatus)
        self.addSubview(runningDryers)
        self.addSubview(runningWashers)
        self.addSubview(nextOpenningWasher)
        self.addSubview(nextOpenningDryer)
        
        hallName.snp.makeConstraints{(make) ->Void in
            make.top.equalTo(self).offset(5)
            make.left.equalTo(self).offset(5)
            make.right.lessThanOrEqualToSuperview()
        }
        
        washersStatus.snp.makeConstraints{(make) ->Void in
            make.top.equalTo(hallName).offset(30)
            make.left.equalTo(self).offset(5)
            make.right.lessThanOrEqualToSuperview()
        }
        
        runningWashers.snp.makeConstraints{(make) ->Void in
            make.top.equalTo(washersStatus).offset(30)
            make.left.equalTo(self).offset(5)
            make.right.lessThanOrEqualToSuperview()
        }
        
        nextOpenningWasher.snp.makeConstraints{(make) ->Void in
            make.top.equalTo(runningWashers).offset(30)
            make.left.equalTo(self).offset(5)
            make.right.lessThanOrEqualToSuperview()
        }
        
        dryersStatus.snp.makeConstraints{(make) ->Void in
            make.top.equalTo(nextOpenningWasher).offset(30)
            make.left.equalTo(self).offset(5)
            make.right.lessThanOrEqualToSuperview()
        }
        
        runningDryers.snp.makeConstraints{(make) ->Void in
            make.top.equalTo(dryersStatus).offset(30)
            make.left.equalTo(self).offset(5)
            make.right.lessThanOrEqualToSuperview()
        }
        
        nextOpenningDryer.snp.makeConstraints{(make) ->Void in
            make.top.equalTo(runningDryers).offset(30)
            make.left.equalTo(self).offset(5)
            make.right.lessThanOrEqualToSuperview()
        }
        
        

    }

}
