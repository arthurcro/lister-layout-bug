//
//  ViewController.swift
//  ListerTest
//
//  Created by Arthur Crocquevieille on 20/10/2021.
//

import UIKit


class TestCell: UICollectionViewCell {

    override var reuseIdentifier: String? { "TestCell" }

    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        layer.cornerRadius = 8
        contentView.backgroundColor = .red
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        layoutAttributes.size = .init(width: cellSize.width, height: cellSize.height)
        return layoutAttributes
    }
}

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
          collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
          collectionView.topAnchor.constraint(equalTo: view.topAnchor),
          collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        collectionView.reloadData()
    }
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = cellSize
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        layout.sectionInset = .init(top: 4, left: 4, bottom: 4, right: 4)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TestCell.self, forCellWithReuseIdentifier: "TestCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

}

// MARK: - Data source
extension MyViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueReusableCell(withReuseIdentifier: "TestCell", for: indexPath)
    }
}
