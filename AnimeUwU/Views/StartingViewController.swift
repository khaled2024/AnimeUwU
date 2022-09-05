//
//  StartingViewController.swift
//  AnimeUwU
//
//  Created by KhaleD HuSsien on 03/09/2022.
//

import UIKit
import AuthenticationServices
import GoogleSignIn
class StartingViewController: UIViewController {
    
    @IBOutlet weak var appleView: UIView!
    @IBOutlet weak var googleView: UIView!
    @IBOutlet weak var facebookView: UIView!
    @IBOutlet weak var signinWithPasswordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDesign()
    }
    private func setUpDesign(){
        signinWithPasswordButton.layer.cornerRadius = signinWithPasswordButton.frame.width / 13
        facebookView.layer.cornerRadius = 10
        facebookView.layer.borderWidth = 1
        facebookView.layer.borderColor = UIColor.systemGray4.cgColor
        googleView.layer.cornerRadius = 10
        googleView.layer.borderWidth = 1
        googleView.layer.borderColor = UIColor.systemGray4.cgColor
        appleView.layer.cornerRadius = 10
        appleView.layer.borderWidth = 1
        appleView.layer.borderColor = UIColor.systemGray4.cgColor
        navigationItem.backButtonTitle = ""
    }
    //MARK: - actions
    @IBAction func facbookBtnTapped(_ sender: UIButton) {
        
    }
    @IBAction func googleBtnTapped(_ sender: UIButton) {
    }
    @IBAction func appleBtnTapped(_ sender: UIButton) {
        let appleIDDetails = ASAuthorizationAppleIDProvider()
        let request = appleIDDetails.createRequest()
        request.requestedScopes = [.email , .fullName]
        let controller  = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.performRequests()
    }
    @IBAction func signinPasswordBtnTapped(_ sender: UIButton) {
        let controller = SigninViewController.instantiate()
        navigationController?.pushViewController(controller, animated: true)
        
    }
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        let controller = RegisterViewController.instantiate()
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
//MARK: - apple delegate
extension StartingViewController: ASAuthorizationControllerDelegate{
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let details =  authorization.credential as? ASAuthorizationAppleIDCredential{
            print(details.user)
            print(details.fullName!)
            print(details.email!)
        }
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error.localizedDescription)
    }
}
