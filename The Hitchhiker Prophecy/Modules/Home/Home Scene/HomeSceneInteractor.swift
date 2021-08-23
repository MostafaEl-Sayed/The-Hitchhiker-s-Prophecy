//
//  HomeSceneInteractor.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

class HomeSceneInteractor: HomeSceneDataStore {
    // MARK: Stored Propirties
    let worker: HomeWorkerType
    let presenter: HomeScenePresentationLogic
    var result: Characters.Search.Results?
    var isLayoutChanged = true

    // MARK: Life cycle
    init(worker: HomeWorkerType, presenter: HomeScenePresentationLogic) {
        self.worker = worker
        self.presenter = presenter
    }
}

extension HomeSceneInteractor: HomeSceneBusinessLogic {
    func changeLayoutButtonTapped() {
        isLayoutChanged.toggle()
        if isLayoutChanged {
            presenter.displayHorizontalLayout()
        } else {
            presenter.displayVerticalLayout()
        }
    }
    
    
    func fetchCharacters() {
        
        let ts = "1"
        /// hash - a md5 digest of the ts parameter, your private key and your public key (e.g. md5(ts+privateKey+publicKey)
        ///
        /// you can use online generator for the hash
        ///    - https://cryptii.com/pipes/md5-hash
        let hash = "68f7ac1ec92ad890763e6d7934094afe" // TODO: Implement
        let limit = HomeScene.Search.Constants.searchPageLimit
        let offset = result?.offset ?? 0
        let input = Characters.Search.Input(timeStamp: ts, apiKey: NetworkConstants.publicKey, hash: hash, offset: offset, limit: limit, orderBy: .modifiedDateDescending)
        
        worker.getCharacters(input) { [weak self] (result) in
            switch result {
            case .success(let value):
                var newData = value
                var oldCharacters = self?.result?.results ?? []
                oldCharacters.append(contentsOf: newData.data.results)
                newData.data.results = oldCharacters
                self?.result = newData.data
            case .failure(let error):
                print(error)
            }
            self?.presenter.presentCharacters(result)
        }
    }
}
