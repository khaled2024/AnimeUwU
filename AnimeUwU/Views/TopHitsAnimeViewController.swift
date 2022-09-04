//
//  TopHitsAnimeViewController.swift
//  AnimeUwU
//
//  Created by KhaleD HuSsien on 04/09/2022.
//

import UIKit

class TopHitsAnimeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top Hits Anime"
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .semibold)]
        UINavigationBar.appearance().titleTextAttributes = attributes
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = .black
        
    }
    
}
