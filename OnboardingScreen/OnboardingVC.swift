//
//  OnboardingVC.swift
//  OnboardingScreen
//
//  Created by Thanh Hoang on 19/09/2022.
//

import UIKit

class OnboardingVC: UIViewController {
    
    //MARK: - UIView
    let bottomView = UIView()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let nextView = UIView()
    let nextBtn = UIButton()
    let previousBtn = UIButton()
    
    //MARK: - Properties
    lazy var models: [OnboardingModel] = {
        return OnboardingModel.shared()
    }()
    
    var currentIndex = 0

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

//MARK: - Setups

extension OnboardingVC {
    
    private func setupViews() {
        //TODO: - BottomView
        bottomView.clipsToBounds = true
        bottomView.backgroundColor = .cyan
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        //TODO: - CollectionView
        collectionView.backgroundColor = .red
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = false
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(OnboardingCVCell.self, forCellWithReuseIdentifier: OnboardingCVCell.id)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        
        //TODO: - NextView
        nextView.clipsToBounds = true
        nextView.layer.cornerRadius = 30.0
        nextView.backgroundColor = UIColor(hex: 0x42433E)
        bottomView.addSubview(nextView)
        nextView.translatesAutoresizingMaskIntoConstraints = false
        
        //TODO: - NextBtn
        nextBtn.clipsToBounds = true
        nextBtn.setImage(UIImage(named: "icon-next"), for: .normal)
        nextBtn.layer.cornerRadius = 30.0
        nextBtn.addTarget(self, action: #selector(nextDidTap), for: .touchUpInside)
        nextView.addSubview(nextBtn)
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        
        //TODO: - PreviousBtn
        previousBtn.clipsToBounds = true
        previousBtn.setImage(UIImage(named: "icon-previous")?.withRenderingMode(.alwaysTemplate), for: .normal)
        previousBtn.tintColor = UIColor(hex: 0x42433E)
        previousBtn.layer.cornerRadius = 30.0
        previousBtn.addTarget(self, action: #selector(previousDidTap), for: .touchUpInside)
        bottomView.addSubview(previousBtn)
        previousBtn.translatesAutoresizingMaskIntoConstraints = false
        
        //TODO: - NSLayoutConstraint
        NSLayoutConstraint.activate([
            bottomView.heightAnchor.constraint(equalToConstant: 60.0),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30.0),
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -30.0),
            
            nextView.widthAnchor.constraint(equalToConstant: 60.0),
            nextView.heightAnchor.constraint(equalToConstant: 60.0),
            nextView.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            nextView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -20.0),
            
            nextBtn.topAnchor.constraint(equalTo: nextView.topAnchor),
            nextBtn.leadingAnchor.constraint(equalTo: nextView.leadingAnchor),
            nextBtn.trailingAnchor.constraint(equalTo: nextView.trailingAnchor),
            nextBtn.bottomAnchor.constraint(equalTo: nextView.bottomAnchor),
            
            previousBtn.widthAnchor.constraint(equalToConstant: 60.0),
            previousBtn.heightAnchor.constraint(equalToConstant: 60.0),
            previousBtn.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            previousBtn.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20.0),
        ])
    }
    
    @objc private func nextDidTap() {
        print("nextDidTap")
    }
    
    @objc private func previousDidTap() {
        print("previousDidTap")
    }
}

//MARK: - UICollectionViewDataSource

extension OnboardingVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCVCell.id, for: indexPath) as! OnboardingCVCell
        cell.model = models[indexPath.item]
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension OnboardingVC: UICollectionViewDelegate {}

//MARK: - UICollectionViewDelegateFlowLayout

extension OnboardingVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenWidth, height: collectionView.bounds.height)
    }
}
