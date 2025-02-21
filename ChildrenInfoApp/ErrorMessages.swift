//
//  ErrorMessages.swift
//  ChildrenInfoApp
//
//  Created by Rubin Vadim on 20.02.2025.
//

import Foundation

enum ErrorMessages: String, Error {
    case cantSaveData = "Something went wrong. The data can't be saved."
    case cantRetriveData = "Something went wrong. The data can't be retrieved."
    case cantDeleteData = "Something went wrong. The data can't be deleted."
}
