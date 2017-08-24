//
//  GroupViewCell.swift
//  siberianpro
//
//  Created by ndolgopolov on 23.08.17.
//  Copyright © 2017 ndolgopolov. All rights reserved.
//

import UIKit
protocol GroupViewCellDelegate {
    func longPressAction(even: Bool)
}
class GroupViewCell: UITableViewHeaderFooterView {

    @IBOutlet weak var groupTitle: UILabel!
    @IBOutlet weak var titleLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleTrailingConstraint: NSLayoutConstraint!
    var delegate: GroupViewCellDelegate!
    var index: Int!
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureUI(){
        groupTitle.font = Constants.GroupHeaderFont
        groupTitle.textColor = Constants.GroupHeaderTextColor
        groupTitle.textAlignment = Constants.GroupHeaderHorizontalAlign
        groupTitle.contentMode = Constants.GroupHeaderVerticalAlign
        contentView.backgroundColor = Constants.GroupHeaderDefaultColor
        titleLeadingConstraint.constant = Constants.GroupHeaderLeftEdge
        titleTrailingConstraint.constant = Constants.GroupHeaderRightEdge
        groupTitle.numberOfLines = Constants.GroupHeaderLines
        
        let pressRecongizer = UILongPressGestureRecognizer(target: self, action: #selector(onPress(_:)))
        pressRecongizer.minimumPressDuration = 0.5
        self.addGestureRecognizer(pressRecongizer)
    }
    
    func onPress(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            contentView.backgroundColor = Constants.GroupHeaderSelectColor
            delegate.longPressAction(even: index%2 == 0)
        } else if gesture.state == .ended {
           contentView.backgroundColor = Constants.GroupHeaderDefaultColor
        }
    }
    
    func setUI(group:groupObj){
        self.groupTitle.text = group.title
    }
}
