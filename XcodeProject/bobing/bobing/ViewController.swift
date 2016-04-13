//
//  ViewController.swift
//  bobing
//
//  Created by 王国良 on 16/4/12.
//  Copyright © 2016年 happystream. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentController = WKUserContentController()
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        config.allowsInlineMediaPlayback = true
        config.allowsAirPlayForMediaPlayback = true
        config.requiresUserActionForMediaPlayback = true
        config.allowsPictureInPictureMediaPlayback = true
        let webview = WKWebView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height), configuration: config)
        self.view.addSubview(webview)
        let webProjectPath = NSBundle.mainBundle().bundlePath + "/WebProject"
        let storageProjectPath = NSTemporaryDirectory() + "/WebProject"
        do {
            try NSFileManager.defaultManager().copyItemAtPath(webProjectPath, toPath: storageProjectPath)
        }
        catch {
            print(error)
        }
        
        let webProjectURL = NSURL(fileURLWithPath: storageProjectPath, isDirectory: true)
        let indexURL = NSURL(fileURLWithPath: storageProjectPath + "/index.html")
        webview.loadFileURL(indexURL, allowingReadAccessToURL: webProjectURL)

        webview.navigationDelegate = self
        
        print("----")
        print(webProjectURL)
        print(indexURL)
        print("auto:" + String(webview.configuration.preferences.javaScriptCanOpenWindowsAutomatically))
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

private typealias navagationDelegate = ViewController
extension navagationDelegate {
//    internal func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
//        print("decidePolicyForNavigationAction")
//    }
    
    /*! @abstract Decides whether to allow or cancel a navigation after its
     response is known.
     @param webView The web view invoking the delegate method.
     @param navigationResponse Descriptive information about the navigation
     response.
     @param decisionHandler The decision handler to call to allow or cancel the
     navigation. The argument is one of the constants of the enumerated type WKNavigationResponsePolicy.
     @discussion If you do not implement this method, the web view will allow the response, if the web view can show it.
     */
//    @available(iOS 8.0, *)
//    internal func webView(webView: WKWebView, decidePolicyForNavigationResponse navigationResponse: WKNavigationResponse, decisionHandler: (WKNavigationResponsePolicy) -> Void) {
//            print("decidePolicyForNavigationResponse")
//    }
    
    /*! @abstract Invoked when a main frame navigation starts.
     @param webView The web view invoking the delegate method.
     @param navigation The navigation.
     */
    @available(iOS 8.0, *)
    internal func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("didStartProvisionalNavigation")
    }
    
    /*! @abstract Invoked when a server redirect is received for the main
     frame.
     @param webView The web view invoking the delegate method.
     @param navigation The navigation.
     */
    @available(iOS 8.0, *)
    internal func webView(webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print("didReceiveServerRedirectForProvisionalNavigation")
    }
    
    /*! @abstract Invoked when an error occurs while starting to load data for
     the main frame.
     @param webView The web view invoking the delegate method.
     @param navigation The navigation.
     @param error The error that occurred.
     */
    @available(iOS 8.0, *)
    internal func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
        print("didFailProvisionalNavigation")
        print(error)
    }
    
    /*! @abstract Invoked when content starts arriving for the main frame.
     @param webView The web view invoking the delegate method.
     @param navigation The navigation.
     */
    @available(iOS 8.0, *)
    internal func webView(webView: WKWebView, didCommitNavigation navigation: WKNavigation!) {
        print("didCommitNavigation")
    }
    
    /*! @abstract Invoked when a main frame navigation completes.
     @param webView The web view invoking the delegate method.
     @param navigation The navigation.
     */
    @available(iOS 8.0, *)
    internal func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
            print("didFinishNavigation")
    }
    
    /*! @abstract Invoked when an error occurs during a committed main frame
     navigation.
     @param webView The web view invoking the delegate method.
     @param navigation The navigation.
     @param error The error that occurred.
     */
    @available(iOS 8.0, *)
    internal func webView(webView: WKWebView, didFailNavigation navigation: WKNavigation!, withError error: NSError) {
        print(error)
    }
    
    /*! @abstract Invoked when the web view needs to respond to an authentication challenge.
     @param webView The web view that received the authentication challenge.
     @param challenge The authentication challenge.
     @param completionHandler The completion handler you must invoke to respond to the challenge. The
     disposition argument is one of the constants of the enumerated type
     NSURLSessionAuthChallengeDisposition. When disposition is NSURLSessionAuthChallengeUseCredential,
     the credential argument is the credential to use, or nil to indicate continuing without a
     credential.
     @discussion If you do not implement this method, the web view will respond to the authentication challenge with the NSURLSessionAuthChallengeRejectProtectionSpace disposition.
     */
    @available(iOS 8.0, *)
    internal func webView(webView: WKWebView, didReceiveAuthenticationChallenge challenge: NSURLAuthenticationChallenge, completionHandler: (NSURLSessionAuthChallengeDisposition, NSURLCredential?) -> Void) {
        print("didReceiveAuthenticationChallenge")
    }
    
    /*! @abstract Invoked when the web view's web content process is terminated.
     @param webView The web view whose underlying web content process was terminated.
     */
    @available(iOS 9.0, *)
    internal func webViewWebContentProcessDidTerminate(webView: WKWebView)
    {
        print("webViewWebContentProcessDidTerminate")
    }
}

