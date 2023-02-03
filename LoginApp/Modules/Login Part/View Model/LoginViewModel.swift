//
//  LoginViewModel.swift
//  LoginApp
//
//  Created by Isagulov urmat on 3/2/23.
//

import Foundation


class LoginViewModel {
    
    private let userName: String = "User"
    private let password: String = "user"
    
    var isUserAuthorized: ((Bool) -> Void)?
    
    func authorizeUser(login: String, password: String){
        
        if login == self.userName && password == self.password{
            isUserAuthorized!(true)
        }else{
            isUserAuthorized!(false)
        }
    }
    
}
