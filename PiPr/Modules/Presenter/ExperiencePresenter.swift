//
//  ExperiencePresenter.swift
//  PiPr
//
//  Created by Pilar Del Rosario Prospero Zeferino on 5/2/19.
//  Copyright © 2019 Pil. All rights reserved.
//

import UIKit

class ExperiencePresenter: NSObject {
    
    weak fileprivate var experienceView : ExperienceViewController?
    
    func attachView(_ view:ExperienceViewController){
        experienceView = view
    }
    
    func detachView() {
        experienceView = nil
    }
    
    func registerCell() {
        experienceView?.tableView.register(UINib.init(nibName: "InformationViewCell", bundle: nil), forCellReuseIdentifier: "informationCell")
    }
    
    func showExperience() {
        
    }
    
    func getInformation() {
        
        guard let tbController = self.experienceView?.tabBarController  as? TabBarController else {
            fatalError()
        }
        if let careerHistory = tbController.resumeInformation?.cv?.careerHistory {
            self.experienceView?.careerHistory = careerHistory
        }
        
        DispatchQueue.main.async{
            //self.experienceView?.tableView.reloadData()
        }
        
    }
    
    func getNumberOfRows() -> Int{
        return experienceView?.careerHistory.count ?? 0
    }

}
