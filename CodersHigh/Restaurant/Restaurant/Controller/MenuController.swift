//
//  MenuController.swift
//  Restaurant
//
//  Created by 강민규 on 2022/03/27.
//

import Foundation
import UIKit

class MenuController {
    static let shared = MenuController()
    var order = Order(){
        // order가 수정되면 orderUpdateNotification을 전송한다.
        didSet {
            NotificationCenter.default.post(name: MenuController.orderUpdateNotification, object: nil)
        }
    }
    static let orderUpdateNotification = Notification.Name("MenuController.orderUpdated")
    
    // 로컬 서버의 베이스 URL
    let baseURL = URL(string: "http://localhost:8080")!
    
    // Categories 받아오는 함수
    func fetchCategories(completion: @escaping ([String]?) -> Void){
        // 베이스 뒤에 경로 붙이는 코드
        let categoryURL = baseURL.appendingPathComponent("categories")
        
        // 서버에서 데이터를 가져와 task를 생성하는 작업
        let task = URLSession.shared.dataTask(with: categoryURL){
            (data, response, error) in
            if let data = data,
               let jsonDictionary = try?
                JSONSerialization.jsonObject(with: data) as?
                [String:Any],
               let categories = jsonDictionary["categories"] as? [String]{
                completion(categories)
                
            }else {
                completion(nil)
            }
        }
        task.resume()
    }
    
    // MenuItems 받아오는 함수
    func fetchMenuItems(forCategory categoryName: String , completion: @escaping ([MenuItem]?) -> Void){
        // 베이스 뒤에 경로 붙이는 코드
        let initialMenuURL = baseURL.appendingPathComponent("menu")
        // 문자열로 받아오기보단 컴포넌트로 쪼개어서 쿼리 아이템을 추가하기 위해서 하는 작업
        var components =  URLComponents(url: initialMenuURL, resolvingAgainstBaseURL: true)!
        // 쿼리 아이템을 추가하는 코드
        components.queryItems = [URLQueryItem(name: "category", value: categoryName)]
        
        // 컴포넌트의 url 을 사용
        let menuURL = components.url!
       
        // 서버에서 데이터를 가져와 task를 생성하는 작업
        let task = URLSession.shared.dataTask(with: menuURL){
            (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
               let menuItems = try? jsonDecoder.decode(MenuItems.self, from:data){
                completion(menuItems.items)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
    
    // Order를 Post 하는 함수
    func submitOrder(forMenuIDs menuIds: [Int] , completion: @escaping (Int?) -> Void){
        let orderURL = baseURL.appendingPathComponent("order")
        var request = URLRequest(url: orderURL)
        
        // 기본이 GET 이라 POST로 변경
        request.httpMethod = "POST"
        
        // json을 받아오는 클라이언트 측 코드
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // 전송할 데이터
        let data : [String : [Int]] = ["menuIds" : menuIds]
        
        // JSON 인코딩으로 시리얼라이즈 하기
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(data)
        request.httpBody = jsonData
        
        // 서버에서 데이터를 가져와 task를 생성하는 작업
        let task = URLSession.shared.dataTask(with: request){
            (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
               let preparationTime = try? jsonDecoder.decode(PreparationTime.self, from: data){
                completion(preparationTime.prepTime)
            }else{
                completion(nil)
            }
        }
        task.resume()
    }
    
    func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void){
        let task = URLSession.shared.dataTask(with: url){
            (data, response, error) in
            if let data = data ,
                let image = UIImage(data: data){
                completion(image)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
