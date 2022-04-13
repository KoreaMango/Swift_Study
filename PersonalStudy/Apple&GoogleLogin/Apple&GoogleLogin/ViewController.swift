//
//  ViewController.swift
//  Apple&GoogleLogin
//
//  Created by 강민규 on 2022/04/10.
//

import UIKit
import AuthenticationServices

class ViewController: UIViewController, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    /// 권한 부여 컨트롤러 는 모달 시트에서 사용자에게 Apple로 로그인 콘텐츠를 표시하는 앱에서 창을 가져오는 함수를 호출합니다
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    

     @IBOutlet weak var loginProviderStackView: UIStackView!
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProviderLoginView()
        // Do any additional setup after loading the view.
    }

    
    /// 샘플 앱 에서 보기 계층 구조에 로그인 양식과 Apple로 로그인 버튼( )을 표시 합니다. 뷰 컨트롤러는 또한 자신을 버튼의 대상으로 추가하고 버튼이 터치업 이벤트를 수신할 때 호출할 작업을 전달합니다.LoginView
    func setupProviderLoginView() {
        let authorizationButton = ASAuthorizationAppleIDButton()
        authorizationButton.addTarget(self, action: #selector(handleAuthorizationAppleIDButtonPress), for: .touchUpInside)
        self.loginProviderStackView.addArrangedSubview(authorizationButton)
        
    }
    
    /// 사용자가 Sign in with Apple 버튼을 탭하면 뷰 컨트롤러가 사용자의 전체 이름과 이메일 주소에 대한 인증 요청을 수행하여 인증 흐름을 시작하는 기능을 호출합니다.
    @objc
    func handleAuthorizationAppleIDButtonPress() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    
    // Apple ID 연동 성공 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        // Apple ID
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
                
            // 계정 정보 가져오기
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
                
            print("User ID : \(userIdentifier)")
            print("User Email : \(email ?? "")")
            print("User Name : \((fullName?.givenName ?? "") + (fullName?.familyName ?? ""))")
            EmailLabel.text = email
            NameLabel.text = fullName?.nickname
        default:
            break
        }
    }
        
    // Apple ID 연동 실패 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
    }
    
    
}

