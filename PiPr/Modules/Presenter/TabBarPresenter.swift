//
//  TabBarPresenter.swift
//  PiPr
//
//  Created by Pilar Del Rosario Prospero Zeferino on 5/2/19.
//  Copyright © 2019 Pil. All rights reserved.
//

import UIKit

protocol TabBarViewProtocol: NSObjectProtocol {
    func setInformation(_ resume: Resume?)
}

class TabBarPresenter: NSObject {
    
    private let resumeService: ResumeService!
    weak fileprivate var tabBarView : TabBarController?
    
    init(resumeService: ResumeService){
        self.resumeService = resumeService
    }
    
    func attachView(_ view:TabBarController){
        tabBarView = view
    }
    
    func detachView() {
        tabBarView = nil
    }
    
    func getInformation(){
        resumeService.getResume(informationRetrieved: {
            [weak self] resume in
            self?.tabBarView?.setInformation(resume ?? nil)
        })
    }
    
    func notifyRetrievedImformation() {
        NotificationCenter.default.post(name: .informationWasRetrieved, object: nil)
    }

}
