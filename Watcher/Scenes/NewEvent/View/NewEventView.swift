//
//  NewEventView.swift
//  Watcher
//
//  Created by Alexandr Kurdyukov on 14/05/2019.
//  Copyright © 2019 Alexandr Kurdyukov. All rights reserved.
//

import UIKit
import SnapKit

class NewEventView: UIView {

    var mainView = UIView()
    var title = UITextField()
    var desc = UITextField()
    var type = UISegmentedControl(items: ["Все", "Места", "ЧП", "События"])
    var button = UIButton(type: .custom)
    var backgroundImage = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViews() {
        
        title.placeholder = "Title"

        desc.placeholder = "Description"
        
        button.setTitle("Send event", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.setTitleShadowColor(.purple, for: .normal)
        button.setTitleShadowColor(.blue, for: .focused)
        
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 15
        backgroundImage.backgroundColor = .yellow
        backgroundImage.isUserInteractionEnabled = false
        
        type.selectedSegmentIndex = 0
        
        addSubview(backgroundImage)
        addSubview(mainView)
        mainView.addSubview(title)
        mainView.addSubview(desc)
        mainView.addSubview(type)
        mainView.addSubview(button)
    }
    
    func configureConstraints() {
        backgroundImage.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        mainView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        title.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(30)
            make.top.equalTo(0)
            make.centerX.equalToSuperview()
        }
        
        desc.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(30)
            make.top.equalTo(title.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
        type.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(30)
            make.top.equalTo(desc.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.top.equalTo(type.snp.bottom).offset(30)
            make.bottom.equalTo(0)
            make.centerX.equalToSuperview()
        }
    }
}
