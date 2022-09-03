//
//  OnboardingCollectionViewCell.swift
//  AnimeUwU
//
//  Created by KhaleD HuSsien on 02/09/2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var onboardingDescriptionLable: UILabel!
    @IBOutlet weak var onboardingOpacityView: UIView!
    @IBOutlet weak var onboardingTitleLable: UILabel!
    @IBOutlet weak var onboardingImageView: UIImageView!
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setGradientBackground()
    }
    func setGradientBackground() {
        let colorTop = UIColor.clear.cgColor
        let colorBottom = UIColor.black.withAlphaComponent(0.8).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.onboardingOpacityView.bounds
        self.onboardingOpacityView.layer.insertSublayer(gradientLayer, at:0)
    }
    func setUp(onboarding: Onboarding){
        self.onboardingImageView.image = UIImage(named: onboarding.image)
        self.onboardingTitleLable.text = onboarding.title
        self.onboardingDescriptionLable.text = onboarding.description
    }
    
}
