//
//  Router.swift
//  CryptoViper
//
//  Created by Doğukan Küçükler on 1.08.2023.
//

import Foundation
import UIKit
//class,protocol
//entrypoint

typealias EntryPoint = AnyView & UIViewController


protocol AnyRouter {
    
    var entry : EntryPoint? {get}
    
    static func startExecution() -> AnyRouter
}
class CryptoRouter : AnyRouter {
  
    var entry: EntryPoint?
    
    static func startExecution() -> AnyRouter {
        let router = CryptoRouter()
       
        var view : AnyView = CryptoViewController()
        var presenter : AnyPresenter = CryptoPresenter()
        var interactor : AnyInteractor = CryptoInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        
        
        router.entry = view as? EntryPoint
        
        
        return router
    }
    
    
    }
    
    

