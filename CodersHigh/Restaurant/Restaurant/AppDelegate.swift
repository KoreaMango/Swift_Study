//
//  AppDelegate.swift
//  Restaurant
//
//  Created by 강민규 on 2022/03/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var orderTabBarItem: UITabBarItem!
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 앱을 쓸때마다 서버에서 사진을 들고 올 수 없으니 캐시를 사용해 앱에 저장해 놓겠다.
        // 캐시에 저장한다.
        let temporaryDircetory = NSTemporaryDirectory()
        let urlCache = URLCache(memoryCapacity: 25_000_000, diskCapacity: 50_000_00, diskPath: temporaryDircetory)
        URLCache.shared = urlCache
        
        // orderUpdateNotification이 실행되면 현재 오브젝트에 updateOrderBadge를 실행히킨다.
        NotificationCenter.default.addObserver(self, selector: #selector(updateOrderBadge), name: MenuController.orderUpdateNotification, object: nil)
        
        orderTabBarItem = (self.window?.rootViewController as? UITabBarController)?.viewControllers?[1].tabBarItem
        
        return true
    }
    
    // 탭바 아이템의 뱃지를 업데이트 시키는 함수
    @objc func updateOrderBadge(){
        switch MenuController.shared.order.menuItems.count{
        case 0:
            orderTabBarItem.badgeValue = nil
        case let count:
            orderTabBarItem.badgeValue = String(count)
        }
        
    }

    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

