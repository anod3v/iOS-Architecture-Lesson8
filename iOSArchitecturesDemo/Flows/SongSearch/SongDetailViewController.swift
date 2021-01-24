//
//  SongDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey on 24/01/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SongDetailViewController: UIViewController {
    
    public var song: ITunesSong
    
    lazy var headerViewController = SongDetailHeaderViewController(song: song)
    
    private let imageDownloader = ImageDownloader()
    
    private var songDetailView: SongDetailView {
        return self.view as! SongDetailView
    }
    
    init(song: ITunesSong) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = AppDetailView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Private
    
    private func configureUI() {
        view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationItem.largeTitleDisplayMode = .never
        
        addChildViewController()
        addDescriptionViewController()
        
    }
    
    private func addChildViewController() {
        self.addChild(headerViewController)
        self.view.addSubview(headerViewController.view)
        
        self.headerViewController.didMove(toParent: self)
        
        headerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerViewController.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            headerViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
    
    private func addDescriptionViewController() {
        // Дз: Добавить дочерний вью контроллер
        let vc = UIViewController()
        
        self.addChild(vc)
        self.view.addSubview(vc.view)
        vc.didMove(toParent: self)
        
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vc.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            vc.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            vc.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            vc.view.heightAnchor.constraint(equalToConstant: 250.0)
        ])
    }
}

