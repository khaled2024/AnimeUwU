//
//  OnboardingViewController.swift
//  AnimeUwU
//
//  Created by KhaleD HuSsien on 27/08/2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet weak var onboardingPageControll: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    //MARK: - vars
    var slides: [Onboarding] = []
    var currentPage = 0 {
        didSet{
            onboardingPageControll.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            }else{
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self
        slides = [
            Onboarding(image: "onboardingImage1", title: "Welcome to AnimeUwU", description: "The best streaming anime app of the century to entertain you every day"),
            Onboarding(image: "onboardingImage2", title: "Welcome to AnimeUwU", description: "AnimeUwU manage you to watch all episodes of your favorite anime series and save them in your favorites"),
            Onboarding(image: "onboardingImage3", title: "Welcome to AnimeUwU", description: "AnimeUwU manage you to search for all episodes with their ratings and characters, and you can also share these episodes on social media")
        ]
        nextButton.layer.cornerRadius = nextButton.frame.width / 13
        onboardingPageControll.numberOfPages = slides.count
    }
    //MARK: - actions
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if currentPage == slides.count - 1{
            let controller = storyboard?.instantiateViewController(withIdentifier: "StartingNC")as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            UserDefaults.standard.hasOnboarded = true
            present(controller, animated: true, completion: nil)
            
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: .zero)
            onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
}
//MARK: - UICollectionViewDelegate,UICollectionViewDataSource
extension OnboardingViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath)as! OnboardingCollectionViewCell
        cell.setUp(onboarding: slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    // To show when we scroll
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        // 0/0 = 0
        // 300/300 = 1
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
    
}
