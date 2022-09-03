//
//  RegisterViewController.swift
//  AnimeUwU
//
//  Created by KhaleD HuSsien on 03/09/2022.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var checkmarkButton: UIButton!
    var isChecked =  false
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .systemGreen
        setUpDesign()
    }
    
    func setUpDesign(){
        self.checkmarkButton.layer.cornerRadius = 10
        self.checkmarkButton.layer.borderColor = UIColor.systemGreen.cgColor
        self.checkmarkButton.layer.borderWidth = 2
        signupButton.layer.cornerRadius = signupButton.frame.width / 13
        navigationItem.backButtonTitle = ""
        
        
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
