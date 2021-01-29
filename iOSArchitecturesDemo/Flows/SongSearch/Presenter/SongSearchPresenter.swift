//
//  SongSearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey on 20/01/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SongSearchViewInput: AnyObject {
    var searchResults: [ITunesSong] { get set }
    
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
}

protocol SongSearchViewOutput: AnyObject {
    func viewDidSearch(with query: String)
    func viewDidSelectSong(app: ITunesSong)
}

class SongPresenter {
    weak var viewInput: (UIViewController & SongSearchViewInput)?
    
    private let searchService = ITunesSearchService()
    let interactor: SongSearchInteractorInput
    let router: SongSearchRouterInput
    
    init(interactor: SongSearchInteractorInput, router: SongSearchRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
    private func requestSong(with query: String) {
        
        interactor.requestSongs(with: query) { [weak self] result in
            guard let self = self else { return }
            
            self.viewInput?.throbber(show: false)
            result
                .withValue { apps in
                    guard !apps.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = apps
                }
                .withError { (error) in
                    self.viewInput?.showError(error: error)
                }
        }
    }
    
    private func openDetails(for app: ITunesSong) {
        router.openDetail(for: app)
        
        
//        let appDetailViewController = AppDetailViewController(app: app)
        
        
//        viewInput?.navigationController?.pushViewController(appDetailViewController, animated: true)
    }
}

extension SongPresenter: SongSearchViewOutput {
    func viewDidSearch(with query: String) {
        viewInput?.throbber(show: true)
        requestSong(with: query)
    }
    
    func viewDidSelectSong(app: ITunesSong) {
        openDetails(for: app)
    }
    
    
}
