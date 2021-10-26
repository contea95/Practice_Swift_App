//
//  SceneDelegate.swift
//  06_Msg-Notification
//
//  Created by 한상혁 on 2021/10/19.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
            if #available(iOS 11.0, *) { // UserNotification 프레임워크를 통한 로컬 알림(iOS 10)
                // 알림 동의 여부 확인, 싱글턴 패턴이라 인스턴스 생성 불가. 인스턴스 받아와서 사용
                UNUserNotificationCenter.current().getNotificationSettings { settings in
                    if settings.authorizationStatus == UNAuthorizationStatus.authorized {
                        // 알림을 동의했을 경우
                        // 발송 내용 정의
                        let nContent = UNMutableNotificationContent()
                        nContent.badge = 1
                        nContent.title = "로컬 알림 메시지"
                        nContent.subtitle = "준비된 내용~~~"
                        nContent.body = "Body~~~"
                        nContent.sound = UNNotificationSound.default
                        nContent.userInfo = ["name" : "홍길동"]
    
                        // 알림 발송 요청 객체
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
    
                        // 알림 요청 객체
                        let request = UNNotificationRequest(identifier: "wakeup", content: nContent, trigger: trigger)
    
                        UNUserNotificationCenter.current().add(request)
                        print("발송 완료")
                    } else {
                        // 알림을 동의하지 않았을 경우
                        print("사용자가 동의하지 않음")
                    }
                }
    
            } else { // UILocalNotification 객체를 이용한 로컬 알림 (iOS 9 이하)
                let application = UIApplication.shared
                let setting = application.currentUserNotificationSettings
                
                // 알림 설정이 되어있는지 확인
                guard setting?.types != .none else {
                    print("Can't Schedule")
                    return
                }
                
                // 로컬 알람 인스턴스 생성
                let noti = UILocalNotification()
                noti.fireDate = Date(timeIntervalSinceNow: 10) // 지금부터 10초 후 발송
                noti.timeZone = TimeZone.autoupdatingCurrent
                noti.alertBody = "다시 접속하세요!"
                noti.alertAction = "학습하기"
                noti.applicationIconBadgeNumber = 1
                noti.soundName = UILocalNotificationDefaultSoundName
                noti.userInfo = ["name":"홍길동"]
                
                // 생성 알람 인스턴스를 스케줄러에 등록
                application.scheduleLocalNotification(noti)
                
            }
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

