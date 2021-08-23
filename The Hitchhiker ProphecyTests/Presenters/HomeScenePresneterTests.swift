//
//  HomeScenePresneterTests.swift
//  The Hitchhiker ProphecyTests
//
//  Created by Mostafa El-Sayed on 23/08/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
@testable import The_Hitchhiker_Prophecy

class HomeScenePresneterTests: XCTestCase {

    let homeSceneDisplayViewSpy = HomeSceneDisplayViewSpy()

    var homeScenePresentationLogic: HomeScenePresentationLogic!


    override func setUp() {
        super.setUp()
        homeScenePresentationLogic = HomeScenePresneter(
            displayView: homeSceneDisplayViewSpy
        )
    }


    func testDisplayHorizontalLayout() {

        // When
        homeScenePresentationLogic.displayHorizontalLayout()
        
        // Then
        XCTAssertTrue(homeSceneDisplayViewSpy.displayHorizontalLayoutCalled, "something went wrong when display horizontal Style ")
    }

    func testDisplayVerticalLayout() {

        // When
        homeScenePresentationLogic.displayVerticalLayout()
        
        // Then
        XCTAssertTrue(homeSceneDisplayViewSpy.displayVerticalLayoutCalled, "something went wrong when display horizontal Style ")
    }

    func testPresentCharactersSuccessState() {
        // Given
        let mockedOutput = Characters.Search.Output.mockedResults()
        let successResponseResult: Result<Characters.Search.Output, NetworkError> = .success(mockedOutput)
        let expectedDisplayedFirstElemntName = "Mostafa"
        let expextedMockedHerosCount = 3
        
        
        // When
        homeScenePresentationLogic.presentCharacters(successResponseResult)
        
        // Then
        XCTAssertEqual(homeSceneDisplayViewSpy.fetchCharactersViewModel?.first?.name, expectedDisplayedFirstElemntName, "something went wrong at present charachters")
        XCTAssertEqual(homeSceneDisplayViewSpy.fetchCharactersViewModel?.count, expextedMockedHerosCount, "something went wrong at present charachters")

    }

    func testPresentCharactersFailureState() {
        // Given
        let failureResponseResult: Result<Characters.Search.Output, NetworkError> = .failure(.server)
        let expectedDisplayedFirstElemntName = "Mostafa"

        // When
        homeScenePresentationLogic.presentCharacters(failureResponseResult)
        
        // Then
        XCTAssertNotEqual(homeSceneDisplayViewSpy.fetchCharactersViewModel?.first?.name, expectedDisplayedFirstElemntName, "something went wrong at present charachters")
        XCTAssertTrue(homeSceneDisplayViewSpy.displayedFailureFetchCharacterError != nil, "something went wrong at present charachters")

    }



}
