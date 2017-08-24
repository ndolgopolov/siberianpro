//
//  ItemViewCell.swift
//  siberianpro
//
//  Created by ndolgopolov on 22.08.17.
//  Copyright © 2017 ndolgopolov. All rights reserved.
//

import UIKit
protocol ItemViewCellDelegate {
    func longPressAction(cell: ItemViewCell)
}

class ItemViewCell: UITableViewCell {

    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var titleLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleTrailingConstraint: NSLayoutConstraint!
    var delegate: ItemViewCellDelegate!
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    func configureUI(){
        itemTitle.font = Constants.ItemCellFont
        itemTitle.textColor = Constants.ItemCellTextColor
        itemTitle.textAlignment = Constants.ItemCellHorizontalAlign
        itemTitle.contentMode = Constants.ItemCellVerticalAlign
        contentView.backgroundColor = Constants.ItemCellDefaultColor
        titleLeadingConstraint.constant = Constants.ItemCellLeftEdge
        titleTrailingConstraint.constant = Constants.ItemCellRightEdge
        itemTitle.numberOfLines = Constants.ItemCellLines
        
        let pressRecongizer = UILongPressGestureRecognizer(target: self, action: #selector(onPress(_:)))
        pressRecongizer.minimumPressDuration = 0.5
        self.addGestureRecognizer(pressRecongizer)
    }
    
    func onPress(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            contentView.backgroundColor = Constants.ItemCellSelectColor
            delegate.longPressAction(cell:self)
        } else if gesture.state == .ended {
            contentView.backgroundColor = Constants.ItemCellDefaultColor
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUI(item:itemObj){
        self.itemTitle.text = item.title
    }
    
}
