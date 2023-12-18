//
//  ViewController.swift
//  I'm chef
//
//  Created by 齋藤温仁 on 2023/11/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //CollectionViewの操作はこちらですよ
        collectionView.delegate = self
        collectionView.dataSource = self
        //collectionViewを登録する
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        //レアウトの調整
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom:15, right: 15)
        collectionView.collectionViewLayout = layout
        
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //表示されるデータの個数を決めます
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectonViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalSpace : CGFloat = 20
        let cellSize : CGFloat = self.view.bounds.width / 2 - horizontalSpace
        return CGSize(width: cellSize, height: cellSize)
    }
}

