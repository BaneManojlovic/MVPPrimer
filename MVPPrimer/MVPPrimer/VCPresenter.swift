//
//  VCPresenter.swift
//  MVPPrimer
//
//  Created by Robert on 2/17/19.
//  Copyright © 2019 Robert. All rights reserved.
//

import Foundation

//kreiramo protokol kojem cemo posle potciniti ViewController
protocol VCDeLegate {
    func showMessage(message: String)
    func userSuccefullyLoggedIn()
}

class VCPresenter: NSObject {
    //kreiramo instancu protokola
    var delegate: VCDeLegate!
    
    //pisemo logiku za validaciju login ekrana
    func validateData(email: String, password: String) {
        if email.count != 0 {
            if password.count != 0 {
                verify(email: email, password: password)
            } else {
                self.delegate.showMessage(message: "Password field should not be empty!")
            }
        } else {
            self.delegate.showMessage(message: "Email field should not be empty!")
        }
    }
    
    
    fileprivate func verify(email: String, password: String) {
        if email == "admin@gmail.com" && password == "123" {
            let user = UserModel(name: "Petar Petrovic",
                                 email: "emailpetar@gmial.com",
                                 password: "123", gender: "Male" )
            self.delegate.userSuccefullyLoggedIn()
        } else {
            self.delegate.showMessage(message: "Please enter valit credentials!")
        }
    }
}
