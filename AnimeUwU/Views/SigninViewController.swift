//
//  SigninViewController.swift
//  AnimeUwU
//
//  Created by KhaleD HuSsien on 03/09/2022.
//

import UIKit

class SigninViewController: UIViewController {
    
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var checkmarkButton: UIButton!
    var isChecked =  false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .systemGreen
        signinButton.layer.cornerRadius = signinButton.frame.width / 13
            setUpDesign()
    }
    
    //MARK: - function
    func setUpDesign(){
        self.checkmarkButton.layer.cornerRadius = 10
        self.checkmarkButton.layer.borderColor = UIColor.systemGreen.cgColor
        self.checkmarkButton.layer.borderWidth = 2
        signinButton.layer.cornerRadius = signinButton.frame.width / 13
        navigationItem.backButtonTitle = ""
        
        
    }
    //MARK: - actions
    @IBAction func checkmarkButtonTapped(_ sender: UIButton) {
        if !isChecked{
            checkmarkButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
            isChecked = true
        }else{
            checkmarkButton.setImage(UIImage(systemName: "xmark"), for: .normal)
            isChecked = false
        }
    }
    @IBAction func signinButtonTapped(_ sender: UIButton) {
        print("Log in :)")
    }
    @IBAction func signupButtonTapped(_ sender: UIButton) {
        let controller = RegisterViewController.instantiate()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
