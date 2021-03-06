//
//  IntermediartModels.swift
//  Restaurant
//
//  Created by 강민규 on 2022/03/27.
//

import Foundation

struct Categories : Codable{
    let categories : [String]
    
}
struct PreparationTime : Codable {
    let prepTime: Int
    
    enum CodingKeys: String , CodingKey{
        case prepTime = "preparation_time"
    }
}
