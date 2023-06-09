//
//  GuestSessionResponseModel.swift
//  MovieApp
//
//  Created by Damir Nuriev on 8.06.2023.
//

import Foundation

struct GuestSessionResponseModel: Decodable {
    let success: Bool
    let guestSessionId: String
    let expiresAt: String
}
