//
//  NewEpisodeCollectionViewCell.swift
//  AnimeUwU
//
//  Created by KhaleD HuSsien on 04/09/2022.
//

import UIKit

class NewEpisodeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ratingLable: UILabel!
    @IBOutlet weak var animeImage: UIImageView!
    @IBOutlet weak var episodeNameLable: UILabel!
    
    
    static let identifer = String(describing: NewEpisodeCollectionViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func config(anime: NewEpisodeViewModel){
        self.animeImage.image = anime.image
        self.ratingLable.text = anime.rating
        self.episodeNameLable.text = anime.episodeName
    }

}
