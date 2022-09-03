//
//  RegisterViewController.swift
//  AnimeUwU
//
//  Created by KhaleD HuSsien on 03/09/2022.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var passwordImageView: UIImageView!
    @IBOutlet weak var emailImageView: UIImageView!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var checkmarkButton: UIButton!
    var isChecked =  false
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTF.delegate = self
        emailTF.delegate = self
        setUpDesign()
        
    }
    
    func setUpDesign(){
        self.checkmarkButton.layer.cornerRadius = 10
        self.checkmarkButton.layer.borderColor = UIColor.systemGreen.cgColor
        self.checkmarkButton.layer.borderWidth = 2
        signupButton.layer.cornerRadius = signupButton.frame.width / 13
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .systemGreen

        
        
    }
    //MARK: - Actions
    @IBAction func checkmarkButtonTapped(_ sender: UIButton) {
        if !isChecked{
            checkmarkButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
            isChecked = true
        }else{
            checkmarkButton.setImage(UIImage(systemName: "xmark"), for: .normal)
            isChecked = false
        }
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        print("created successfully")
    }
    @IBAction func signinButtonTapped(_ sender: UIButton) {
        let controller = SigninViewController.instantiate()
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
//MARK: - extensions
extension RegisterViewController : UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == emailTF {
            emailView.backgroundColor = #colorLiteral(red: 0.9262279868, green: 0.9862291217, blue: 0.9550411105, alpha: 1)
            emailView.layer.borderWidth = 1
            emailView.layer.borderColor = UIColor.systemGreen.cgColor
            emailImageView.image = UIImage(systemName: "mail.fill")
        }else{
            passwordView.backgroundColor = #colorLiteral(red: 0.9262279868, green: 0.9862291217, blue: 0.9550411105, alpha: 1)
            passwordView.layer.borderWidth = 1
            passwordView.layer.borderColor = UIColor.systemGreen.cgColor
            passwordImageView.image = UIImage(systemName: "lock.fill")
        }
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTF {
            emailView.backgroundColor = #colorLiteral(red: 0.9586427808, green: 0.9629181027, blue: 0.973944366, alpha: 1)
            emailView.layer.borderColor = UIColor.clear.cgColor
            emailImageView.image = UIImage(systemName: "mail")
        }else{
            passwordView.backgroundColor = #colorLiteral(red: 0.9586427808, green: 0.9629181027, blue: 0.973944366, alpha: 1)
            passwordView.layer.borderColor = UIColor.clear.cgColor
            passwordImageView.image = UIImage(systemName: "lock")

        }
    }
}
