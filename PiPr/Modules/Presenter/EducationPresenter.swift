//
//  EducationPresenter.swift
//  PiPr
//
//  Created by Pilar Del Rosario Prospero Zeferino on 5/2/19.
//  Copyright © 2019 Pil. All rights reserved.
//

import UIKit

class EducationPresenter: NSObject {
    
    weak fileprivate var educationView : EducationViewController?
    
    func attachView(_ view:EducationViewController){
        educationView = view
    }
    
    func detachView() {
        educationView = nil
    }
    
    func registerCell() {
        educationView?.tableView.register(UINib.init(nibName: "InformationViewCell", bundle: nil), forCellReuseIdentifier: "informationCell")
    }
    
    func getInformation() {
        
        guard let tbController = self.educationView?.tabBarController  as? TabBarController else {
            fatalError()
        }
        if let educationHistory = tbController.resumeInformation?.cv?.education {
            self.educationView?.educationHistory = educationHistory
        }
        
        DispatchQueue.main.async{
            //self.experienceView?.tableView.reloadData()
        }
        
    }
    
    func getNumberOfRows() -> Int{
        return educationView?.educationHistory.count ?? 0
    }

}
