//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Isagulov urmat on 24/1/23.
//

import UIKit
import SnapKit

class LoginViewController: BaseViewController {
    
    private lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        
        mainLabel.text = "Sign in"
        mainLabel.textColor = UIColor(red: 0.322, green: 0.329, blue: 0.392, alpha: 1)
        mainLabel.textAlignment = .center
        mainLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        
        return mainLabel
    }()
    
    private lazy var iconImage: UIImageView = {
        let iv = UIImageView()
        
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "logo")
        
        return iv
    }()
   
    private lazy var stackView: UIStackView = {
        let sv = UIStackView()
        
        sv.axis = .vertical
        sv.spacing = 16
        sv.distribution = .fillEqually
        
        
        return sv
    }()
    
    private lazy var nameTextField: UITextField = {
        let tf = UITextField()
        
        tf.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        tf.placeholder = "Username"
        tf.setLeftPaddingPoints(16)
        tf.delegate = self
        
        
        
        
        return tf
    }()
    
    private lazy var passTextField: UITextField = {
        let tf = UITextField()
        
        tf.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        tf.placeholder = "Password"
        tf.setLeftPaddingPoints(16)
        tf.isSecureTextEntry = true
        tf.delegate = self
        
        tf.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
        
        return tf
    }()
    
    private lazy var secureIcon: UIImageView = {
        let iv = UIImageView()
        
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "shape")
        iv.isUserInteractionEnabled = true
        
        let iconTapped = UITapGestureRecognizer(target: self, action: #selector(secureIconTapped))
        iv.addGestureRecognizer(iconTapped)
        
        return iv
    }()
    
    private lazy var forgotPassButtonLabel: UILabel = {
        let forgot = UILabel()
        
        forgot.text = "Forgot your password?"
        forgot.textAlignment = .right
        forgot.textColor = UIColor(red: 0.514, green: 0.514, blue: 0.569, alpha: 1)
        forgot.font = .systemFont(ofSize: 16, weight: .semibold)
        
        forgot.isUserInteractionEnabled = true
        let tappedForgot = UITapGestureRecognizer(target: self, action: #selector(forgotPassTapped))
        forgot.addGestureRecognizer(tappedForgot)
        
        return forgot
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = UIColor(red: 0.127, green: 0.766, blue: 0.687, alpha: 1)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
        
        
        
        return button
    }()
    
    private lazy var stackLastLabel: UIStackView = {
        let sv = UIStackView()
        
        sv.axis = .horizontal
        sv.spacing = 4
        sv.distribution = .fillProportionally
        
        return sv
    }()
    
    private lazy var firstLabelSignUp: UILabel = {
        let mainLabel = UILabel()
        
        mainLabel.text = "Don't have an account?"
        mainLabel.textColor = UIColor(red: 0.322, green: 0.329, blue: 0.392, alpha: 1)
        mainLabel.textAlignment = .center
        mainLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        mainLabel.textAlignment = .right
        
        return mainLabel
    }()
    
    private lazy var secondLabelSignUp: UILabel = {
        let mainLabel = UILabel()
        
        mainLabel.text = "Sign up"
        mainLabel.textColor = UIColor(red: 0.322, green: 0.329, blue: 0.392, alpha: 1)
        mainLabel.textAlignment = .center
        mainLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        mainLabel.textAlignment = .left
        
        mainLabel.adjustsFontSizeToFitWidth = true
        mainLabel.minimumScaleFactor = 0.5
        
        mainLabel.isUserInteractionEnabled = true
        let tappedForgot = UITapGestureRecognizer(target: self, action: #selector(signUpTapped))
        mainLabel.addGestureRecognizer(tappedForgot)
        
        return mainLabel
    }()
    
    var viewModel = LoginViewModel()
    
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(mainLabel)
        view.addSubview(iconImage)
        view.addSubview(stackView)
        view.addSubview(secureIcon)
        view.addSubview(forgotPassButtonLabel)
        view.addSubview(loginButton)
        view.addSubview(stackLastLabel)
        
        [nameTextField, passTextField].forEach{stackView.addArrangedSubview($0)}
        [firstLabelSignUp, secondLabelSignUp].forEach{stackLastLabel.addArrangedSubview($0)}
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        mainLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            
        }
        
        iconImage.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(iconImage.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            
        }
        
        secureIcon.snp.makeConstraints {
            $0.centerY.equalTo(passTextField.snp.centerY)
            $0.trailing.equalTo(passTextField.snp.trailing).inset(22)
            $0.size.equalTo(30)
        }
        
        forgotPassButtonLabel.snp.makeConstraints {
            $0.top.equalTo(passTextField.snp.bottom).offset(14)
            $0.trailing.equalToSuperview().inset(30)
            
            
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(forgotPassButtonLabel.snp.bottom).offset(50)
            $0.trailing.equalToSuperview().offset(-30)
            $0.leading.equalToSuperview().offset(30)
            $0.height.equalTo(60)
            
        }
        
        stackLastLabel.snp.makeConstraints {
            $0.top.lessThanOrEqualTo(loginButton.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginButton.snp.bottom).offset(150)
//            $0.trailing.equalToSuperview().offset(-62)
//            $0.leading.equalToSuperview().offset(62)
        }
        
    }
    
    override func setupValues() {
        super.setupValues()
        
        viewModel.isUserAuthorized = { (isAuthorized) in
            print("Bool \(isAuthorized)")
        }
    }
}

extension LoginViewController {
    
    @objc func secureIconTapped() {
        passTextField.isSecureTextEntry = !passTextField.isSecureTextEntry
    }
    
    @objc func forgotPassTapped() {
        print("tap tap")
    }
    
    @objc func signUpTapped() {
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func loginTapped() {
        guard let login = nameTextField.text, let password = passTextField.text else {return}
        
        if !login.isEmpty && !password.isEmpty {
            viewModel.authorizeUser(login: login, password: password)
        }
        
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
