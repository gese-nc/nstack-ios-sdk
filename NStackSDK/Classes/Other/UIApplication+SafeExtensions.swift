//
//  UIApplication+SafeExtensions.swift
//  NStackSDK
//
//  Created by Dominik Hádl on 11/02/2017.
//  Copyright © 2017 Nodes ApS. All rights reserved.
//

import Foundation

#if canImport(UIKit)
import UIKit
#endif

#if os(iOS) || os(tvOS)

extension UIApplication {
    class func safeSharedApplication() -> UIApplication? {
        guard UIApplication.responds(to: NSSelectorFromString("sharedApplication")),
            let unmanagedSharedApplication = UIApplication.perform(NSSelectorFromString("sharedApplication")) else {
                return nil
        }

        return unmanagedSharedApplication.takeRetainedValue() as? UIApplication
    }

    func safeOpenURL(_ url: URL) {
        guard self.canOpenURL(url) else { return }

        self.open(url, options: [:], completionHandler: nil)
    }
    
    public var currentWindow: UIWindow? {
        if #available(iOS 13.0, *) {
            let connectedScenes = UIApplication.shared.connectedScenes
                .filter { $0.activationState == .foregroundActive }
                .compactMap { $0 as? UIWindowScene }
            let currentWindow = connectedScenes.first?
                .windows
                .first { $0.isKeyWindow }
            return currentWindow
        } else {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        }
    }
}

#endif
