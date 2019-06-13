//
//  ServiceError.swift
//  WeatherFinish
//
//  Created by JinBae Jeong on 13/06/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation

enum ServiceError: Error {
    case noData
    case clientError
    case invalidStatusCode
    case invalidFormat
}
