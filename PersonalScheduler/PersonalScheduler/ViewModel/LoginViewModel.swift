//
//  LoginViewModel.swift
//  PersonalScheduler
//
//  Created by brad on 2023/01/09.
//

import Foundation
import FirebaseAuth

final class LoginViewModel: ObservableObject {
    
    enum LoginResultAlert {
        case success, fail, normal
    }
    
    private let firebaseLoginManager = FirebaseLoginManager()
    private let kakaoLoginManager = KakaoLoginManager()
    
    @Published var isAutoLogin = true
    @Published var isLoggedIn: Bool = false
    @Published var isActiveAlert: Bool = false
    @Published var accountUID: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    @Published var loginResultAlert: LoginResultAlert = .normal
    
    func checkAutoLoginInfo() {
        if let userId = UserDefaults.standard.string(forKey: "id"){
            self.email = userId
            self.password = UserDefaults.standard.string(forKey: "password") ?? ""
            
            firebaseLogin()
        }
    }
    
    func firebaseLogin() {
        loginResultAlert = .normal
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                print("Error : \(error.localizedDescription)")
                self?.errorMessage = error.localizedDescription
                self?.loginResultAlert = .fail
                return
            }
            guard let user = result?.user else { return }
            self?.accountUID = user.uid
            self?.loginResultAlert = .success
        }
        isActiveAlert.toggle()
        
        if isAutoLogin {
            UserDefaults.standard.set(self.email, forKey: "id")
            UserDefaults.standard.set(self.password, forKey: "password")
        }
    }

    @MainActor
    func kakaoLogIn() {
        Task {
            if await kakaoLoginManager.handleLogin(completion: { [weak self] response in
                switch response {
                    
                case .success(let data):
                    self?.accountUID = data.uid
                    self?.isLoggedIn = true
                    if ((self?.isAutoLogin) != nil) {
                        UserDefaults.standard.set(data.email, forKey: "id")
                        UserDefaults.standard.set(data.password, forKey: "password")
                    }
                case .failure(_):
                    print("error")
                }
            }) {
                isLoggedIn = false
            }
        }
    }
}
