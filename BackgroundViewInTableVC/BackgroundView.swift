//
//  BackgroundView.swift
//  SpaceBasic
//
//  Created by kashee on 10/01/19.
//  Copyright © 2019 Smaat. All rights reserved.
//

import UIKit

class BackgroundView: UIView {

    let controlsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    lazy var imageView:UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "error"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var textView:UITextView = {
        let txtView = UITextView()
        txtView.translatesAutoresizingMaskIntoConstraints = false
        txtView.text = "You are offline You are offline You are offline You are offline You are offline You are offline You are offline You are offline You are offline You are offline You are offline You are offline You are offline You are offline You are offline You are offline"
        txtView.sizeToFit()
        txtView.isScrollEnabled = false
        txtView.textColor = .black
        txtView.backgroundColor = .orange
        return txtView
    }()
    
    lazy var retryButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Try Again", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        controlsContainerView.frame = frame
        addSubview(controlsContainerView)
        
        setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        
        [imageView, textView, retryButton].forEach{ controlsContainerView.addSubview($0) }
        
        imageView.topAnchor.constraint(equalTo: controlsContainerView.topAnchor, constant:100).isActive = true
        imageView.centerXAnchor.constraint(equalTo: controlsContainerView.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        textView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        textView.leadingAnchor.constraint(equalTo: controlsContainerView.leadingAnchor, constant: 10).isActive = true
        textView.trailingAnchor.constraint(equalTo: controlsContainerView.trailingAnchor, constant: -10).isActive = true
        textView.heightAnchor.constraint(greaterThanOrEqualToConstant: 10).isActive = true
        
        retryButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20).isActive = true
        retryButton.centerXAnchor.constraint(equalTo: controlsContainerView.centerXAnchor).isActive = true
        retryButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        retryButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        
    }
    
}
