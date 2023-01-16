//
//  DataProviderService.swift
//  SquareEmployeeDirectoryApp
//
//  Created by Andrea Monroy on 1/14/23.
//

import Foundation
import Combine

protocol DataProviderProtocol {
    func downloadData() -> AnyPublisher<[String], Error>
}
