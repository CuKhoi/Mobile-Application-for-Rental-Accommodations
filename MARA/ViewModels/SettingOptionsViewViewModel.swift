//
//  SettingOptionsViewViewModel.swift
//  MARA
//
//  Created by USER on 30/01/2024.
//

import Foundation
import SwiftUI
enum SettingsOptionsViewModel: Int, CaseIterable, Identifiable {
    case editProfile
    case myBooking
    case notifications
    case customerSupport

    var title : String {
        switch self {
            case .editProfile: return "Edit Profile"
            case .myBooking: return "My Booking"
            case .notifications: return "Notifications"
            case .customerSupport : return "Customer Support"

        }
    }
    var imageName : String {
        switch self {
            case .editProfile: return "person.circle.fill"
            case .myBooking: return "house.circle.fill"
            case .notifications : return "bell.circle.fill"
            case .customerSupport : return "person.bubble.fill"
        }
        }
        var imageBackgroundColor : Color {
            switch self {
            case .editProfile: return  .black
            case .myBooking: return Color(.systemBlue)
            case .notifications : return Color(.systemPurple)
            case .customerSupport : return Color(.systemGreen)
        }
    }
    var id: Int {
        return self .rawValue
    }
}

