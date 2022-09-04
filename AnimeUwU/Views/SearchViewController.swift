//
//  SearchViewController.swift
//  AnimeUwU
//
//  Created by KhaleD HuSsien on 04/09/2022.
//

import UIKit

class SearchViewController: UIViewController  {
    
    @IBOutlet weak var topSearchTableView: UITableView!
    private let searchController: UISearchController = {
        let result = SearchResultViewController()
        let vc = UISearchController(searchResultsController: result)
        vc.searchBar.placeholder = "Search for..!"
        vc.searchBar.searchBarStyle = .minimal
        vc.definesPresentationContext = true
        return vc
    }()
    var topSearchAnimes: [Anime] = []
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.decrease.circle"), style: .done, target: self, action: nil)
        topSearchAnimes = [
            Anime(image: UIImage(named: "swordArtOnline2")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
            Anime(image: UIImage(named: "swordArtOnline")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
            Anime(image: UIImage(named: "swordArtOnline2")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
            Anime(image: UIImage(named: "swordArtOnline")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
            Anime(image: UIImage(named: "swordArtOnline2")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10")
        ]
        topSearchTableView.register(UINib(nibName: TopSearchTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TopSearchTableViewCell.identifier)
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = .label
    }
    
}
//MARK: - extensions
extension SearchViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text , !text.trimmingCharacters(in: .whitespaces).isEmpty else{
            return
        }
        print(text)
    }
}
extension SearchViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        topSearchAnimes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TopSearchTableViewCell.identifier, for: indexPath)as! TopSearchTableViewCell
        let anime = topSearchAnimes[indexPath.row]
        cell.config(anime: TopSearchViewModel(image: anime.image, Name: anime.title))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let view = UIView()
        view.backgroundColor = .systemGreen
        if section == 0{
            return "Top Searchs"
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let view = UIView()
            view.backgroundColor = .clear
            let image = UIImageView.init(image: UIImage(named: "topSearch"))
            image.frame = CGRect(x: 10, y: 5, width: 35, height: 35)
            view.addSubview(image)
            let lable = UILabel()
            lable.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            lable.frame = CGRect(x: 45, y: 5, width: 100, height: 35)
            lable.text = "Top Searchs"
            view.addSubview(lable)
            return view
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
}




