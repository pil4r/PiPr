//
//  ResumeService.swift
//  PiPr
//
//  Created by Pilar Del Rosario Prospero Zeferino on 5/2/19.
//  Copyright © 2019 Pil. All rights reserved.
//

import UIKit

class ResumeService: NSObject {
    
    func getResume(informationRetrieved: @escaping (_ resume: Resume?) -> ()) {
        DispatchQueue.main.async {
            guard let url = URL(string: "https://gist.githubusercontent.com/pil4r/00b3c8afd95e30915574c430ba989337/raw/5e5a5ddab5cafb4bfb041d5ed4556db7fd06ae87/cvTest.json") else {fatalError()}
            
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                guard let data = data else { return }
                print(String(data: data, encoding: .utf8)!)
                
                do {
                    let decoder = JSONDecoder()
                    let gitData = try decoder.decode(Resume.self, from: data)
                    informationRetrieved(gitData)
                    
                } catch let err {
                    print("Err", err)
                }
            }
            task.resume()
        }
    }

}
