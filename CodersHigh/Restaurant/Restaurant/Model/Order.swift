//
//  Order.swift
//  Restaurant
//
//  Created by 강민규 on 2022/03/27.
//

import Foundation

struct Order : Codable {
    var menuItems : [MenuItem]
    
    init(menuItems : [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
