//
//  SongSearchBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey on 20/01/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

import UIKit

class SongSearchBuilder {
    static func build() -> (UIViewController & SongSearchViewInput) {
        let interactor = SongSearchInteractor()
        let router = SongSearchRouter()
        
        let presenter = SongPresenter(interactor: interactor, router: router)
        let viewController = SongSearchViewController(presenter: presenter)
        
        router.viewController = viewController
        presenter.viewInput = viewController
        return viewController
    }
}
