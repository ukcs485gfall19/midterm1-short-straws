//
//  RootViewController.swift
//  ShortStrawsProject
//
//  Created by Greg Schloemer on 9/29/19.
//  Copyright © 2019 Greg Schloemer. All rights reserved.
//

import UIKit
import MarkupFramework

enum NavigationContext {
  case launched
  case browsing
  case editing
}

class RootViewController: UIViewController {
    
    lazy var documentBrowser: DocumentBrowserViewController = {
        return DocumentBrowserViewController()
    }()
    
    var presentationContext: NavigationContext = .launched
    
    func displayDocumentBrowser(inboundURL: URL? = nil, importIfNeeded: Bool = true){
        if presentationContext == .launched {
            present(documentBrowser, animated: false)
        }
        presentationContext = .browsing
    }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    displayDocumentBrowser()
  }
  
  func displayMarkupController(presenter: UIViewController) {
    presentationContext = .editing
    let controller = MarkupViewController.freshController()
    presenter.present(controller, animated: true)
  }
}