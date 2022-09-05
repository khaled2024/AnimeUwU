//
//  AnimeDetailViewController.swift
//  AnimeUwU
//
//  Created by KhaleD HuSsien on 05/09/2022.
//

import UIKit
import ProgressHUD
import AVKit
class AnimeDetailViewController: UIViewController, AVPlayerViewControllerDelegate {
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var episodeCollectionView: UICollectionView!
    var playerController = AVPlayerViewController()
    var episodes : [AnimeEpisode] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        episodeCollectionView.delegate = self
        episodeCollectionView.dataSource = self
        downloadButton.layer.borderColor = UIColor.systemGreen.cgColor
        downloadButton.layer.borderWidth = 1.2
        navigationItem.backBarButtonItem?.tintColor = .white
        navigationItem.backButtonTitle = ""
        episodes = [
            AnimeEpisode(name: "sword art online", image: UIImage(named: "swordArtOnline2")!, videoUrl: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"),
            AnimeEpisode(name: "sword art online", image: UIImage(named: "swordArtOnline")!, videoUrl: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"),
            AnimeEpisode(name: "sword art online", image: UIImage(named: "swordArtOnline2")!, videoUrl: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"),
            AnimeEpisode(name: "sword art online", image: UIImage(named: "swordArtOnline")!, videoUrl: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"),
            AnimeEpisode(name: "sword art online", image: UIImage(named: "swordArtOnline2")!, videoUrl: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        ]
        episodeCollectionView.register(UINib(nibName: EpisodeVideoCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: EpisodeVideoCollectionViewCell.identifier)
    }
    //MARK: - functions
    func play(indexpath: IndexPath){
        let episode = episodes[indexpath.row]
        guard let videoUrl = URL(string: episode.videoUrl)else{
            return
        }
        let player = AVPlayer(url: videoUrl)
        playerController = AVPlayerViewController()
        playerController.player = player
        playerController.allowsPictureInPicturePlayback = true
        playerController.delegate = self
        playerController.player?.play()
        self.present(playerController, animated: true)
    }
}
//MARK: - UICollectionViewDelegate , UICollectionViewDataSource
extension AnimeDetailViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeVideoCollectionViewCell.identifier, for: indexPath)as! EpisodeVideoCollectionViewCell
        let animeEpisode = episodes[indexPath.row]
        cell.config(episode: EpisodeVideoViewModel(image: animeEpisode.image, Name: animeEpisode.name, videoUrl: animeEpisode.videoUrl))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        play(indexpath: indexPath)
    }
    
}
