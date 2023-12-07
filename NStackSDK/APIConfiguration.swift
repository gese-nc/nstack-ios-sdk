//
//  APIConfiguration.swift
//  NStackSDK
//
//  Created by Dominik Hádl on 02/12/2016.
//  Copyright © 2016 Nodes ApS. All rights reserved.
//

import Foundation

struct APIConfiguration {
    let appId: String
    let restAPIKey: String
    let isFlat: Bool
    let isProduction: Bool
    let localizationUrlOverride: String?
    let nmeta: NMeta
    let baseUrl: String
    let subKey: String

    init(appId: String = "",
         restAPIKey: String = "",
         isFlat: Bool = false,
         isProduction: Bool = true,
         localizationUrlOverride: String? = nil,
         nmeta: NMeta,
         baseUrl: String,
         subKey: String = "") {
        self.appId = appId
        self.restAPIKey = restAPIKey
        self.isFlat = isFlat
        self.isProduction = isProduction
        self.localizationUrlOverride = localizationUrlOverride
        self.nmeta = nmeta
        self.baseUrl = baseUrl
        self.subKey = subKey
    }
}
