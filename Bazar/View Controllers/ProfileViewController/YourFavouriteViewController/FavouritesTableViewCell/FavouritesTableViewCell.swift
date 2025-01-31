//
//  FavouritesTableViewCell.swift
//  Bazar
//
//  Created by Naveed Khalid on 30/01/2025.
//



import UIKit

class FavouritesTableViewCell: UITableViewCell {

    let favouriteImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    let fvtDes: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .appFont(.RobotoMedium, size: 16)
        label.textColor = .appColor(.black)
        return label
    }()
    
    let priceLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .appFont(.RobotoBold, size: 14)
        label.textColor = .appColor(.purple)
        return label
    }()
    
    let heartImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Love-Fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        contentView.addSubview(favouriteImageView)
        contentView.addSubview(fvtDes)
        contentView.addSubview(heartImageView)
        contentView.addSubview(priceLbl)

        NSLayoutConstraint.activate([

            favouriteImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            favouriteImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            fvtDes.leadingAnchor.constraint(equalTo: favouriteImageView.trailingAnchor, constant: 16),
            fvtDes.topAnchor.constraint(equalTo: favouriteImageView.topAnchor),
            
            priceLbl.topAnchor.constraint(equalTo: fvtDes.bottomAnchor, constant: 4),
            priceLbl.leadingAnchor.constraint(equalTo: favouriteImageView.trailingAnchor, constant: 16),
            
            heartImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            heartImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
