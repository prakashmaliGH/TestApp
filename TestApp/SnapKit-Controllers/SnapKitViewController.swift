//
//  ViewController.swift
//  TestApp
//
//  Created by Prakash Mali on 10/27/20.
//  Copyright © 2020 Prakash Mali. All rights reserved.
//

import UIKit
import SnapKit


class SnapKitViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavbar()
    }
    
    func setupNavbar(){
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setupViews() {
        
        
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {  (make) in
            make.edges.equalToSuperview()
        }
        
        
        let view1 = UIView()
        view1.backgroundColor = .blue
        scrollView.addSubview(view1)
        view1.snp.makeConstraints { (make) in
            make.height.equalTo(200)
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(10)
        }
        
        let view3 = UIView()
        view3.backgroundColor = .blue
        scrollView.addSubview(view3)
        view3.snp.makeConstraints { (make) in
            make.height.equalTo(200)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
        }
        
        let view2 = UIView()
        view2.backgroundColor = .red
        scrollView.addSubview(view2)
        view2.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.top.equalTo(view1.snp.bottom).offset(10)
            make.bottom.equalTo(view3.snp.top).offset(-10)
            make.leading.trailing.equalToSuperview()
        }
        
        let contentView = UIView()
        view2.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.top.leading.equalToSuperview()
            make.bottom.trailing.equalToSuperview()
        }

        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ---Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.-----Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ---Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ---Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
        
        label.lineBreakMode = .byWordWrapping
        contentView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(20)
            make.bottom.trailing.equalToSuperview().offset(-20)
        }
        
    }
}
