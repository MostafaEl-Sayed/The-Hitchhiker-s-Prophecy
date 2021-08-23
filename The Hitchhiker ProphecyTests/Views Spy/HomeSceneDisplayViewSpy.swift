//
//  HomeSceneDisplayViewSpy.swift
//  The Hitchhiker ProphecyTests
//
//  Created by Mostafa El-Sayed on 23/08/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

@testable import The_Hitchhiker_Prophecy

class HomeSceneDisplayViewSpy: HomeSceneDisplayView {
    var interactor: HomeSceneBusinessLogic?
    var router: HomeSceneRoutingLogic?

    var displayHorizontalLayoutCalled = false
    var displayVerticalLayoutCalled = false
    var displayedFailureFetchCharacterError: Error?
    var fetchCharactersViewModel: [HomeScene.Search.ViewModel]?
    
    func didFetchCharacters(viewModel: [HomeScene.Search.ViewModel]) {
        fetchCharactersViewModel = viewModel
    }
    
    func failedToFetchCharacters(error: Error) {
        displayedFailureFetchCharacterError = error
    }
    
    func displayHorizontalLayout() {
        displayHorizontalLayoutCalled = true
    }
    
    func displayVerticalLayout() {
        displayVerticalLayoutCalled = true
    }

}
