//
//  AuthService.swift
//  Reimagine
//
//  Created by Vishwam Pandya on 10/27/20.
//

import Foundation
import Amplify

class AuthService: ObservableObject {
    @Published var isSignedIn = false
    
    func checkSessionStatus() {
        _ = Amplify.Auth.fetchAuthSession(listener: { (result) in
            
            switch result {
            case .success(let session):
                print(session)
                DispatchQueue.main.async {
                    self.isSignedIn = session.isSignedIn
                }
                   
            case .failure(let error):
                print(error)
            }
        })
    }
}
