//
//  Constants.swift
//  siberianpro
//
//  Created by ndolgopolov on 23.08.17.
//  Copyright © 2017 ndolgopolov. All rights reserved.
//

import UIKit
struct Constants {

    static let GroupHeaderHeight: CGFloat = 48
    static let GroupHeaderDefaultColor : UIColor = UIColor(hexString: "#FFFFFF")
    static let GroupHeaderSelectColor : UIColor = UIColor(hexString: "#BABABA")
    static let GroupHeaderTextSize: CGFloat = 16
    static let GroupHeaderTextColor : UIColor = UIColor(hexString: "#333333")
    static let GroupHeaderLeftEdge: CGFloat = 36
    static let GroupHeaderRightEdge: CGFloat = 16
    static let GroupHeaderFont: UIFont = UIFont(name: "Roboto-Light", size: CGFloat(Constants.GroupHeaderTextSize)) ?? UIFont.systemFont(ofSize: CGFloat(Constants.GroupHeaderTextSize))
    static let GroupHeaderLines: Int = 1
    static let GroupHeaderHorizontalAlign: NSTextAlignment = .left
    static let GroupHeaderVerticalAlign: UIViewContentMode = .center
    
    static let ItemCellHeight: CGFloat = 48
    static let ItemCellDefaultColor : UIColor = UIColor(hexString: "#EEEEEE")
    static let ItemCellSelectColor : UIColor = UIColor(hexString: "#BABABA")
    static let ItemCellTextSize: CGFloat = 16
    static let ItemCellTextColor : UIColor = UIColor(hexString: "#333333")
    static let ItemCellLeftEdge: CGFloat = 36
    static let ItemCellRightEdge: CGFloat = 16
    static let ItemCellFont: UIFont = UIFont(name: "Roboto-Light", size: CGFloat(Constants.ItemCellTextSize)) ?? UIFont.systemFont(ofSize: CGFloat(Constants.ItemCellTextSize))
    static let ItemCellLines: Int = 1
    static let ItemCellHorizontalAlign: NSTextAlignment = .left
    static let ItemCellVerticalAlign: UIViewContentMode = .center
    
    
}
