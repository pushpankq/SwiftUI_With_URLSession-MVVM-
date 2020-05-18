//
//  WebView.swift
//  RecipeApp
//
//  Created by Puspank Kumar on 18/05/20.
//  Copyright © 2020 Puspank Kumar. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let request: URLRequest
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        
        uiView.load(request)
    }
}
