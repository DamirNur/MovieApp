//
//  GuestSessionResponse.swift
//  MovieApp
//
//  Created by Damir Nuriev on 8.06.2023.
//

import Foundation

struct GuestSessionResponse: Codable {
    let success: Bool
    let guest_session_id: String
    let expires_at: String
}
