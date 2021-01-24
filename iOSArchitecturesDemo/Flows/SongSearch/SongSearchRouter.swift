//
//  SongSearchRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey on 24/01/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SongSearchRouterInput {
    func openDetail(for app: ITunesSong)
    func openSongInItunes(app: ITunesSong)
}

class SongSearchRouter: SongSearchRouterInput {
    weak var viewController: UIViewController?
    
    func openDetail(for app: ITunesSong) {
//        let appDetailViewController = AppDetailViewController(app: app)
//        viewController?.navigationController?.pushViewController(appDetailViewController, animated: true)
    }
    
    func openSongInItunes(app: ITunesSong) {
//        guard let urlString = app.appUrl, let url = URL(string: urlString) else {
//            return
//        }
//        
//        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
