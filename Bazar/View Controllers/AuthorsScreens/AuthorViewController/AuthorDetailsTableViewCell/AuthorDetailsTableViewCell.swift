import UIKit

class AuthorDetailsTableViewCell: UITableViewCell {
    
     let authorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let authorNameLabel: UILabel = {
        let label = UILabel()
        label.font = .appFont(.openSansBold, size: 18)
        label.textColor = .appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     let authorDescriptionLabel: UILabel = {
        let label = UILabel()
         label.font = .appFont(.robotoRegular, size: 14)
         label.textColor = .appColor(.grey)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(authorImageView)
        contentView.addSubview(authorNameLabel)
        contentView.addSubview(authorDescriptionLabel)
        
        NSLayoutConstraint.activate([
          
            authorImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            authorImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            authorImageView.widthAnchor.constraint(equalToConstant: 68),
            authorImageView.heightAnchor.constraint(equalToConstant: 68),
            
        
            authorNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            authorNameLabel.leadingAnchor.constraint(equalTo: authorImageView.trailingAnchor, constant: 12),
            authorNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
     
            authorDescriptionLabel.topAnchor.constraint(equalTo: authorNameLabel.bottomAnchor, constant: 6),
            authorDescriptionLabel.leadingAnchor.constraint(equalTo: authorNameLabel.leadingAnchor),
            authorDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            authorDescriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
