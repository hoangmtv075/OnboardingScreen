//
//  OnboardingCVCell.swift
//  OnboardingScreen
//
//  Created by Thanh Hoang on 19/09/2022.
//

import UIKit

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height

class OnboardingCVCell: UICollectionViewCell {
    
    //MARK: - Properties
    static let id = "OnboardingCVCell"
    
    let titleLbl = UILabel()
    let separatorView = UIView()
    let subLbl = UILabel()
    let coverImageView = UIImageView()
    
    var model: OnboardingModel! {
        didSet {
            titleLbl.text = model.title
            subLbl.text = model.sub
            coverImageView.image = model.image
        }
    }
    
    //MARK: - Initializes
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

//MARK: - Configures

extension OnboardingCVCell {
    
    private func configureCell() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        
        //TODO: - TitleLbl
        titleLbl.font = UIFont(name: "Palatino-Bold", size: 30.0)
        titleLbl.textColor = .black
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.widthAnchor.constraint(equalToConstant: screenWidth-40).isActive = true
        
        //TODO: - TitleLbl
        separatorView.clipsToBounds = true
        separatorView.backgroundColor = UIColor(hex: 0xCBD1D3)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.widthAnchor.constraint(equalToConstant: screenWidth-40).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        
        //TODO: - SubLbl
        subLbl.font = UIFont(name: "Palatino-Roman", size: 20.0)
        subLbl.textColor = .black
        subLbl.numberOfLines = 0
        subLbl.translatesAutoresizingMaskIntoConstraints = false
        subLbl.widthAnchor.constraint(equalToConstant: screenWidth-40).isActive = true
        
        //TODO: - UIStackView
        let stackView = UIStackView()
        stackView.spacing = 20.0
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.addArrangedSubview(titleLbl)
        stackView.addArrangedSubview(separatorView)
        stackView.addArrangedSubview(subLbl)
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        //TODO: - TitleLbl
        coverImageView.clipsToBounds = true
        coverImageView.contentMode = .scaleAspectFit
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coverImageView)
        
        //TODO: - NSLayoutConstraint
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20.0),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            coverImageView.widthAnchor.constraint(equalToConstant: screenWidth*(330/375)),
            coverImageView.heightAnchor.constraint(equalToConstant: screenWidth*(330/375)),
            coverImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            coverImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20.0),
        ])
    }
}
