//
//  ListViewModel.swift
//  siberianpro
//
//  Created by ndolgopolov on 23.08.17.
//  Copyright © 2017 ndolgopolov. All rights reserved.
//

import UIKit
import SwiftyJSON
class ListViewModel: NSObject {

    var listArray:[groupObj] = []
    override init() {
        super.init()
        let file = Bundle.main.path(forResource: "list", ofType: "json")
        if let data = try? Data(contentsOf: URL(fileURLWithPath: file!)) {
        listArray = self.parse(data: data);
        }
    
    }
    
    func parse(data: Data) -> [groupObj] {
        var groups: [groupObj] = []
        guard let groupsJson = JSON(data: data).array else {
            return []
        }
        for groupJson in groupsJson {
            var items: [itemObj] = []
            if let itemsJson = groupJson["itemArray"].array {
                for itemJson in itemsJson {
                    let item = itemObj(title: itemJson["title"].string ?? "")
                    items.append(item)
                }
            } else {
                continue
            }
            if items.count > 0 {
                let group = groupObj(title: groupJson["title"].string ?? "", itemArray: items)
                groups.append(group)
            }
        }
        print("array")
        return groups
    }
    
    
    
}
