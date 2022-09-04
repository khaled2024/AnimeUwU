//
//  TopSearchTableViewCell.swift
//  AnimeUwU
//
//  Created by KhaleD HuSsien on 04/09/2022.
//

import UIKit

class TopSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var animeNameLable: UILabel!
    @IBOutlet weak var animeImageView: UIImageView!
    
    static let identifier = String(describing: TopSearchTableViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func config(anime: TopSearchViewModel){
        self.animeImageView.image = anime.image
        self.animeNameLable.text = anime.Name
    }
    
}
