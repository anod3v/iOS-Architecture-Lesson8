//
//  SongDetailHeaderViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey on 24/01/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SongDetailHeaderViewController: UIViewController {
    
    private let song: ITunesSong
    
    private let imageDownLoader = ImageDownloader()
    
    private var appDetailHeaderView: AppDetailHeaderView {
        return self.view as! AppDetailHeaderView
    }
    
    init(song: ITunesSong) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = AppDetailHeaderView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fillData()
    }
    
    private func fillData() {
        downloadImage()
        appDetailHeaderView.titleLabel.text = song.trackName
        appDetailHeaderView.subtitleLabel.text = song.artistName
//        appDetailHeaderView.ratingLabel.text = song.averageRating.flatMap { "\($0)" }
    }
    
    private func downloadImage() {
        guard let url = self.song.artwork else { return }
        
        imageDownLoader.getImage(fromUrl: url) { [weak self] (image, _) in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.appDetailHeaderView.imageView.image = image
            }
        }
        
    }
}

