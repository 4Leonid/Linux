//
//  PhotoCollectionViewController.swift
//  ProjectOne
//
//  Created by Леонид Турко on 27.02.2024.
//

import UIKit

final class PhotoCollectionViewController: UICollectionViewController {
  
  private let networkService = NetworkService()
  private var photos: [Photo] = []
  
  private let numberOfItemsPerRow: CGFloat = 2
  private let interItemSpacing: CGFloat = 4
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollection()
    fetchData()
  }
}

extension PhotoCollectionViewController {
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    photos.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseIdentifier, for: indexPath) as? PhotoCell else { return UICollectionViewCell() }
    
    let photo = photos[indexPath.item]
    cell.configure(photo: photo)
    return cell
  }
  
  private func setupCollection() {
    collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseIdentifier)
    collectionView.backgroundColor = .white
  }
  
  private func fetchData() {
    networkService.getPhotos { [weak self] photos in
      self?.photos = photos
      DispatchQueue.main.async {
        self?.collectionView.reloadData()
      }
    }
  }
}

extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let maxWidth = UIScreen.main.bounds.width
    let totalSpacing = interItemSpacing * numberOfItemsPerRow
    let itemWidth = ((maxWidth - totalSpacing) / numberOfItemsPerRow) - interItemSpacing * 2
    let itemHeight = itemWidth / 2
    
    return CGSize(width: itemWidth, height: itemHeight)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    let space = interItemSpacing
    return UIEdgeInsets(top: space, left: space, bottom: space, right: space)
  }
}
