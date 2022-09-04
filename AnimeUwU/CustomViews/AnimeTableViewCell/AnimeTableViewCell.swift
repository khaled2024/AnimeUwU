//
//  AnimeTableViewCell.swift
//  AnimeUwU
//
//  Created by KhaleD HuSsien on 04/09/2022.
//

import UIKit

class AnimeTableViewCell: UITableViewCell {

    @IBOutlet weak var myListButton: UIButton!
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var animeYearLable: UILabel!
    @IBOutlet weak var animeNameLable: UILabel!
    @IBOutlet weak var ratingLable: UILabel!
    @IBOutlet weak var animeImageView: UIImageView!
    
    static let identifier = String(describing: AnimeTableViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func config(anime: AnimeTopHitsViewModel){
        self.animeImageView.image = anime.image
        self.descriptionLable.text = anime.description
        self.animeNameLable.text = anime.title
        self.ratingLable.text = anime.rating
        self.animeYearLable.text = anime.year
        
    }
    
}
