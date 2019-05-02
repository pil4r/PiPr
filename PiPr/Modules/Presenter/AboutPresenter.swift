//
//  AboutPresenter.swift
//  PiPr
//
//  Created by Pilar Del Rosario Prospero Zeferino on 5/2/19.
//  Copyright © 2019 Pil. All rights reserved.
//

import UIKit

protocol AboutProtocol: NSObjectProtocol {

}

class AboutPresenter: NSObject {
    
    weak fileprivate var aboutView : AboutViewController?
    
    func attachView(_ view:AboutViewController){
        aboutView = view
    }
    
    func detachView() {
        aboutView = nil
    }
    
    func updateInformation() {
        
        guard let tbController = self.aboutView?.tabBarController  as? TabBarController else {
            fatalError()
        }
        if let personalInfo = tbController.resumeInformation?.cv?.personalInformation {
            self.aboutView?.personalInformation = personalInfo
        }
        
        DispatchQueue.main.async{
            self.aboutView?.tableView.reloadData()
            self.aboutView?.tableViewHeight.constant = (self.aboutView?.tableView.contentSize.height ?? 0.0) + 100.0
        }
        
    }
    
    func getNumberOfRows() -> Int{
        
        if let array = aboutView?.personalInformation?.aditionalInformation {
            return array.count
        }
        return 0
    }
    
    func getPersonalInformation() -> PersonalInformation?{
        guard let tbController = aboutView?.tabBarController  as? TabBarController else {
            return nil
        }
        if let personalInfo = tbController.resumeInformation?.cv?.personalInformation {
            return personalInfo
        }
        return nil
    }
    
    func getInfoForRow(index: Int) -> AditionalInformation? {

        guard let info = aboutView?.personalInformation?.aditionalInformation, info.count > index else {
            return nil
        }
        return info[index]
    }
    
}
