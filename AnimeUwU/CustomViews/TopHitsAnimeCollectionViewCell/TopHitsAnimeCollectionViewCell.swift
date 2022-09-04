//
//  TopHitsAnimeCollectionViewCell.swift
//  AnimeUwU
//
//  Created by KhaleD HuSsien on 04/09/2022.
//

import UIKit

class TopHitsAnimeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ratingLable: UILabel!
    @IBOutlet weak var animeImage: UIImageView!
    
    static let identifer = String(describing: TopHitsAnimeCollectionViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func config(anime: Anime){
        self.animeImage.image = anime.image
        self.ratingLable.text = anime.rating
    }
}
