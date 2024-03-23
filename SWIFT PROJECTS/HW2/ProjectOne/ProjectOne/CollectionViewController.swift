//
//  CollectionViewController.swift
//  ProjectOne
//
//  Created by Леонид Турко on 27.02.2024.
//

import UIKit

final class CollectionViewController: UICollectionViewController {
  
  private let numberOfItemsPerRow: CGFloat = 2
  private let interItemSpacing: CGFloat = 4
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollection()
  }
}

extension CollectionViewController {
  
  private func setupCollection() {
    collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.reuseIdentifier)
    collectionView.backgroundColor = .white
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    6
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseIdentifier, for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell() }
    cell.tap = { [weak self] image in
      let detailVC = DetailViewController()
      detailVC.image = image
      self?.navigationController?.pushViewController(detailVC, animated: true)
    }
    cell.backgroundColor = .systemPink
    return cell
  }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
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
