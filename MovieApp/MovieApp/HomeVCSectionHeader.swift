//
//  HomeVCSectionHeader.swift
//  MovieApp
//
//  Created by Damir Nuriev on 6.09.2023.
//

import UIKit

class HomeVCSectionHeader: UICollectionReusableView {
    static let headerId = "HomeVCSectionHeader"
    
    var title = UILabel()
    var arrow = UIImageView()
	let emptyView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        customizeElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customizeElements() {
        title.textColor = .black
        title.font = R.Fonts.helvelticaRegular(with: 18)
        title.textAlignment = .left
        title.translatesAutoresizingMaskIntoConstraints = false
        
        arrow.image = R.Images.Common.rightArrow
        arrow.tintColor = .black
        arrow.translatesAutoresizingMaskIntoConstraints = false

		emptyView.translatesAutoresizingMaskIntoConstraints = false
		emptyView.backgroundColor = .clear
		emptyView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    }
    
    public func setupConstraints() {
        addSubview(title)
        addSubview(arrow)
		addSubview(emptyView)
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            arrow.topAnchor.constraint(equalTo: topAnchor),
            arrow.bottomAnchor.constraint(equalTo: bottomAnchor),
            arrow.leadingAnchor.constraint(equalTo: title.trailingAnchor),
			arrow.trailingAnchor.constraint(equalTo: emptyView.leadingAnchor),

			emptyView.topAnchor.constraint(equalTo: topAnchor),
			emptyView.bottomAnchor.constraint(equalTo: bottomAnchor),
			emptyView.leadingAnchor.constraint(equalTo: arrow.trailingAnchor),
			emptyView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
