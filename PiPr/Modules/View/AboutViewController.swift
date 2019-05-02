//
//  AboutViewController.swift
//  PiPr
//
//  Created by Pilar Del Rosario Prospero Zeferino on 5/2/19.
//  Copyright © 2019 Pil. All rights reserved.
//

import UIKit
import Foundation

class AboutViewController: UIViewController, AboutProtocol {
    
    
    var personalInformation:PersonalInformation?
    private let aboutPresenter = AboutPresenter()

    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgViewProfile: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.register(UINib.init(nibName: "DataViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.tableView.isScrollEnabled = false
        
        NotificationCenter.default.addObserver(self,
                                       selector: #selector(updateView),
                                       name: .informationWasRetrieved
            ,
                                       object: nil
        )
        
        aboutPresenter.attachView(self)
    }
    
    @objc func updateView() {
        aboutPresenter.updateInformation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupView()
    }
    
    func setupView() {
        self.imgViewProfile.layer.cornerRadius = self.imgViewProfile.frame.width/2
        self.imgViewProfile.layer.borderColor = UIColor.white.cgColor
        self.imgViewProfile.layer.borderWidth = 1.0
        tableViewHeight.constant = tableView.contentSize.height
    }

}

extension AboutViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aboutPresenter.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DataViewCell else {
            return UITableViewCell()
        }
        
        let info = aboutPresenter.getInfoForRow(index: indexPath.row)
        
        cell.lblTitle.text = info?.personalKey ?? ""
        cell.imgViewDescription.text = info?.personalVale ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
