//
//  AppEnvironment.swift
//  WorldOfPAYBACK
//
//  Created by Jacek Dogiel on 11/10/2023.
//

struct EnvironmentConfig {
    let baseURL: String
}

struct AppEnvironment {
    var configuration: EnvironmentConfig {
        #if DEBUG
            return EnvironmentConfig(baseURL: "https://api-test.payback.com")
        #else
            return EnvironmentConfig(baseURL: "https://api.payback.com")
        #endif
    }
}
