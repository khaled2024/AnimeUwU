//
//  TopHitsAnimeViewController.swift
//  AnimeUwU
//
//  Created by KhaleD HuSsien on 04/09/2022.
//

import UIKit

class TopHitsAnimeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var topHitsAnime : [Anime] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top Hits Anime"
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .semibold)]
        UINavigationBar.appearance().titleTextAttributes = attributes
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        topHitsAnime = [
            Anime(image: UIImage(named: "swordArtOnline2")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
            Anime(image: UIImage(named: "swordArtOnline")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
            Anime(image: UIImage(named: "swordArtOnline2")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
            Anime(image: UIImage(named: "swordArtOnline")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
            Anime(image: UIImage(named: "swordArtOnline2")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
        ]
        registerCell()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = .label
        navigationItem.backButtonTitle = ""
        
    }
    func registerCell(){
        tableView.register(UINib(nibName: AnimeTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: AnimeTableViewCell.identifier)
    }
    
}
extension TopHitsAnimeViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        topHitsAnime.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AnimeTableViewCell.identifier, for: indexPath)as! AnimeTableViewCell
        let anime = topHitsAnime[indexPath.row]
        cell.config(anime: AnimeTopHitsViewModel(image: anime.image, rating: anime.rating, title: anime.title, year: anime.year, description: anime.description))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let animeDetails = AnimeDetailViewController.instantiate()
        navigationController?.pushViewController(animeDetails, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
