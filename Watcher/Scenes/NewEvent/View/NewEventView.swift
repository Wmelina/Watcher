//
//  NewEventView.swift
//  Watcher
//
//  Created by Alexandr Kurdyukov on 14/05/2019.
//  Copyright © 2019 Alexandr Kurdyukov. All rights reserved.
//

import UIKit
import SnapKit
import UIColor_Hex_Swift

class NewEventView: UIView {

    var mainView = UIView()
    var title = UITextField()
    var desc = UITextField()
    var type = UISegmentedControl(items: ["Места", "ЧП", "События"])
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
        
        title.placeholder = "Имя события"
        title.tintColor = .blue
        title.layer.shadowColor = UIColor.black.cgColor
        title.backgroundColor = UIColor("#4169E1")
        title.layer.cornerRadius = 7
        title.textColor = .white
        
        desc.placeholder = "Описание события"
        desc.backgroundColor = UIColor("#4169E1")
        desc.layer.cornerRadius = 7
        desc.textColor = .white
        
        button.setTitle("Отправить событие", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.backgroundColor = UIColor("#8A2BE2")
        button.layer.cornerRadius = 20
        
        backgroundImage.backgroundColor = UIColor("#87CEFA")
        backgroundImage.isUserInteractionEnabled = false
        
        type.selectedSegmentIndex = 0
        type.tintColor = UIColor("#4169E1")
        
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
            make.height.equalTo(40)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.top.equalTo(type.snp.bottom).offset(30)
            make.bottom.equalTo(0)
            make.centerX.equalToSuperview()
        }
    }
}
