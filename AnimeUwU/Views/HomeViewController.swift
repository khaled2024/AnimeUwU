//
//  HomeViewController.swift
//  AnimeUwU
//
//  Created by KhaleD HuSsien on 03/09/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var newEpisodeReleasesCollectionView: UICollectionView!
    @IBOutlet weak var topHitsAnimeCollectionView: UICollectionView!
    @IBOutlet weak var myListPosterButton: UIButton!
    @IBOutlet weak var playPosterButton: UIButton!
    @IBOutlet weak var LogoOpacityView: UIView!
    @IBOutlet weak var LogoImageView: UIImageView!
        // vars
    var animes: [Anime] = []

    //MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        topHitsAnimeCollectionView.delegate = self
        topHitsAnimeCollectionView.dataSource = self
        newEpisodeReleasesCollectionView.delegate = self
        newEpisodeReleasesCollectionView.dataSource = self
        animes = [
            Anime(image: UIImage(named: "swordArtOnline")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
            Anime(image: UIImage(named: "swordArtOnline")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
            Anime(image: UIImage(named: "swordArtOnline")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
            Anime(image: UIImage(named: "swordArtOnline")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
            Anime(image: UIImage(named: "swordArtOnline")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
        ]
        setUpDesign()
        registerCells()
        

    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = .white
        
    }
    //MARK: - private functions
    private func setUpDesign(){
        navigationItem.backButtonTitle = ""
        myListPosterButton.layer.borderColor = UIColor.white.cgColor
        LogoOpacityView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        setUpNavigationItems()
        //  setGradientBackground()
        myListPosterButton.layer.borderWidth = 1
        
    }
    private func setGradientBackground() {
        let colorTop = UIColor.clear.cgColor
        let colorBottom = UIColor.black.withAlphaComponent(0.6).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.LogoOpacityView.bounds
        self.LogoOpacityView.layer.insertSublayer(gradientLayer, at:0)
    }
    func setUpNavigationItems(){
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "bell"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .done, target: self, action: #selector(didTappedSearch))
        ]
        
    }
    func registerCells(){
        topHitsAnimeCollectionView.register(UINib(nibName: TopHitsAnimeCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: TopHitsAnimeCollectionViewCell.identifer)
        newEpisodeReleasesCollectionView.register(UINib(nibName: TopHitsAnimeCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: TopHitsAnimeCollectionViewCell.identifer)
    }
    @objc func didTappedSearch(){
        
        let controller = SearchViewController.instantiate()
        navigationController?.pushViewController(controller, animated: true)
        
    }
    //MARK: - Actions
    @IBAction func seeAllTopHitsAnimeTapped(_ sender: UIButton) {
        let controller = TopHitsAnimeViewController.instantiate()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func seeAllNewEpisodeReleasesTapped(_ sender: UIButton) {
        let controller = NewEpisodeReleasesViewController.instantiate()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
//MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == topHitsAnimeCollectionView {
            return animes.count
        }else{
            return animes.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topHitsAnimeCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopHitsAnimeCollectionViewCell.identifer, for: indexPath) as? TopHitsAnimeCollectionViewCell else{
                return UICollectionViewCell()
            }
            let anime = animes[indexPath.row]
            cell.config(anime: AnimeViewModel(image: anime.image, rating: anime.rating))
            return cell
        }else{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopHitsAnimeCollectionViewCell.identifer, for: indexPath) as? TopHitsAnimeCollectionViewCell else{
                return UICollectionViewCell()
            }
            let anime = animes[indexPath.row]
            cell.config(anime: AnimeViewModel(image: anime.image, rating: anime.rating))
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}
