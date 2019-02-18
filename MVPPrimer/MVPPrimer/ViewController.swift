//
//  ViewController.swift
//  MVPPrimer
//
//  Created by Robert on 2/17/19.
//  Copyright © 2019 Robert. All rights reserved.
//

import UIKit

class ViewController: UIViewController, VCDeLegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var msgToTheUserLabel: UILabel!
    
    // MARK: - Properties
    
    var presenter: VCPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        msgToTheUserLabel.isHidden = true
        presenter = VCPresenter()
        presenter.delegate = self
    }

    // MARK: - Actions
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        msgToTheUserLabel.isHidden = true
        self.presenter.validateData(email: emailTextField.text!, password: passwordTextField.text!)
    }
    
    // MARK: - Presenter delegates
    
    func showMessage(message: String) {
        self.msgToTheUserLabel.isHidden = false
        self.msgToTheUserLabel.text = "Login Failed"
        self.msgToTheUserLabel.textColor = UIColor.red
        
    }
    
    func userSuccefullyLoggedIn() {
        self.msgToTheUserLabel.isHidden = false
        self.msgToTheUserLabel.text = "User loggedin"
        self.msgToTheUserLabel.textColor = UIColor.green
    }
    
    
}

