//
//  newEpisodeReleasesViewController.swift
//  AnimeUwU
//
//  Created by KhaleD HuSsien on 04/09/2022.
//

import UIKit

class NewEpisodeReleasesViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var newEpisodeAnimes : [Anime] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New Episode Releases"
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 19, weight: .regular)]
        UINavigationBar.appearance().titleTextAttributes = attributes
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        newEpisodeAnimes = [
            Anime(image: UIImage(named: "swordArtOnline2")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
            Anime(image: UIImage(named: "swordArtOnline2")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
            Anime(image: UIImage(named: "swordArtOnline")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
            Anime(image: UIImage(named: "swordArtOnline2")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
            Anime(image: UIImage(named: "swordArtOnline")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
            Anime(image: UIImage(named: "swordArtOnline2")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
            Anime(image: UIImage(named: "swordArtOnline")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
            Anime(image: UIImage(named: "swordArtOnline2")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
            Anime(image: UIImage(named: "swordArtOnline")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
            Anime(image: UIImage(named: "swordArtOnline2")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
        ]
        collectionView.register(UINib(nibName: NewEpisodeCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: NewEpisodeCollectionViewCell.identifer)

    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = .label
        navigationItem.backBarButtonItem?.tintColor = .white
        navigationItem.backButtonTitle = ""
    }

}
extension NewEpisodeReleasesViewController: UICollectionViewDelegate,UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        newEpisodeAnimes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewEpisodeCollectionViewCell.identifer, for: indexPath)as? NewEpisodeCollectionViewCell else{
            return UICollectionViewCell()
        }
        let anime = newEpisodeAnimes[indexPath.row]
        cell.config(anime: NewEpisodeViewModel(image: anime.image, rating: anime.rating, title: anime.title, year: anime.year, description: anime.description, episodeName: anime.episodeName))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let animeDetails = AnimeDetailViewController.instantiate()
        navigationController?.pushViewController(animeDetails, animated: true)
    }
    
    
}
