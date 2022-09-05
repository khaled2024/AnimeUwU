//
//  EpisodeVideoCollectionViewCell.swift
//  AnimeUwU
//
//  Created by KhaleD HuSsien on 05/09/2022.
//

import UIKit

class EpisodeVideoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var animeImageView: UIImageView!
    
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var playButton: UIButton!
    static let identifier = String(describing: EpisodeVideoCollectionViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        playButton.layer.cornerRadius = playButton.width / 4

    }
    
    func config(episode: EpisodeVideoViewModel){
        self.episodeName.text = episode.Name
        self.animeImageView.image = episode.image
    }

}
