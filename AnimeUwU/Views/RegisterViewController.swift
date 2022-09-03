//
//  StartingViewController.swift
//  AnimeUwU
//
//  Created by KhaleD HuSsien on 03/09/2022.
//

import UIKit

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
    }
    //MARK: - actions
    @IBAction func facbookBtnTapped(_ sender: UIButton) {
    }
    @IBAction func googleBtnTapped(_ sender: UIButton) {
    }
    @IBAction func appleBtnTapped(_ sender: UIButton) {
    }
    @IBAction func signinPasswordBtnTapped(_ sender: UIButton) {
    }
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
    }
    
}
