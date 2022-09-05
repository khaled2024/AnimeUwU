//
//  SearchResultViewController.swift
//  AnimeUwU
//
//  Created by KhaleD HuSsien on 04/09/2022.
//

import UIKit

class SearchResultViewController: UIViewController{
    
    let tableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(UINib(nibName: TopSearchTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TopSearchTableViewCell.identifier)
        
        tableView.isHidden = false
        return tableView
    }()
    let noDataImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "NoSearchResult"))
        image.isHidden = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    let noDataLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lable.textAlignment = .center
        lable.text = "Sorry, the keyword you entered could not be found Try to check again or search with other keywords "
        lable.numberOfLines = 0
        return lable
    }()
    let searchResults : [Anime] = [
        Anime(image: UIImage(named: "swordArtOnline2")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
        Anime(image: UIImage(named: "swordArtOnline")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
        Anime(image: UIImage(named: "swordArtOnline2")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
        Anime(image: UIImage(named: "swordArtOnline")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10"),
        Anime(image: UIImage(named: "swordArtOnline2")!, rating: "9.9", title: "Sword art online", year: "2020", description: "Sword art online Sword art online Sword art online Sword art online Sword art online Sword art online", episodeName: "Episode 10")
    ]
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.949019134, green: 0.9490200877, blue: 0.9705254436, alpha: 1)
        view.addSubview(noDataImage)
        view.addSubview(noDataLable)
        view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: 90, width: view.frame.size.width, height: view.frame.size.height)
        noDataLable.frame = CGRect(x: 10, y: (noDataImage.frame.origin.y + noDataImage.frame.size.height)+30 , width: view.frame.width - 20, height: 80)
        noDataImage.frame = view.bounds
    }
    func update(text: String){
        if text == "Empty"{
            tableView.isHidden = true
            noDataImage.isHidden = false
            noDataLable.isHidden = false
        }else{
            tableView.isHidden = false
            noDataImage.isHidden = true
            noDataLable.isHidden = true
        }
        tableView.reloadData()
    }
    
}
//MARK: - UITableViewDelegate
extension SearchResultViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TopSearchTableViewCell.identifier, for: indexPath)as! TopSearchTableViewCell
        let anime = searchResults[indexPath.row]
        cell.config(anime: TopSearchViewModel(image: anime.image, Name: anime.title))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let animeDetails = AnimeDetailViewController.instantiate()
        self.present(animeDetails, animated: true)
    }
}
