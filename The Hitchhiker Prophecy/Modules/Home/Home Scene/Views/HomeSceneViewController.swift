//
//  HomeSceneViewController.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/10/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit
import AVFoundation

class HomeSceneViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Stored Properties
    var interactor: HomeSceneBusinessLogic?
    var router: HomeSceneRoutingLogic?
    private var viewModel: [HomeScene.Search.ViewModel]?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        interactor?.fetchCharacters()
    }

    // MARK: - Private Helpers
    private func setupViews() {
        setupCollectionView()
    }
    private func setupCollectionView() {
        let layout =  CustomHorizontalFlowLayout()
//        layout.delegate = nil
        collectionView.collectionViewLayout = layout
        let puppyCell = UINib(nibName: "HomeCharacterCollectionViewCell", bundle: nil)
        collectionView.register(puppyCell, forCellWithReuseIdentifier: "HomeCharacterCollectionViewCell")
        
    }
    
}

extension HomeSceneViewController: HomeSceneDisplayView {
    func didFetchCharacters(viewModel: [HomeScene.Search.ViewModel]) {
        // TODO: Implement
        self.viewModel = viewModel
        let layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.reloadData()
    }
    
    func failedToFetchCharacters(error: Error) {
        // TODO: Implement
    }
}

// MARK: UICollectionViewDataSource
extension HomeSceneViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCharacterCollectionViewCell", for: indexPath) as? HomeCharacterCollectionViewCell else {
            return UICollectionViewCell()
        }
        let row = indexPath.row
        if let character = viewModel?[row] {
            cell.configure(with: character)
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        router?.routeToCharacterDetailsWithCharacter(at: indexPath.row)
    }
}

