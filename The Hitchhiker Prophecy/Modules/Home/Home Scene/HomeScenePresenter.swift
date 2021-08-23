//
//  HomeScenePresenter.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

class HomeScenePresneter {
    weak var displayView: HomeSceneDisplayView?
    
    init(displayView: HomeSceneDisplayView) {
        self.displayView = displayView
        
    }

}

// MARK: - HomeScenePresentationLogic
extension HomeScenePresneter: HomeScenePresentationLogic {

    func presentCharacters(_ response: HomeScene.Search.Response) {
        // TODO: Implement
        switch response {
        case .success(let output):
           
            let characters = output.data.results.map({
                 HomeScene.Search.ViewModel(
                    name: $0.name,
                    desc: $0.resultDescription,
                    imageUrl: "\($0.thumbnail.path)/\(CharacterDetailsScene.Constants.ImageSize.Portrait.uncanny.rawValue).\($0.thumbnail.thumbnailExtension)",
                    comics: $0.comics.collectionURI,
                    series: $0.series.collectionURI,
                    stories: $0.stories.collectionURI,
                    events: $0.events.collectionURI
                )
            })
            displayView?.didFetchCharacters(viewModel: characters)
        case .failure(let error):
            displayView?.failedToFetchCharacters(error: error)
        }
    }

    func displayHorizontalLayout() {
        displayView?.displayHorizontalLayout()
    }

    func displayVerticalLayout() {
        displayView?.displayVerticalLayout()
    }
}
