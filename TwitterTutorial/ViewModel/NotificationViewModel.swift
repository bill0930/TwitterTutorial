//
//  NotificationViewModel.swift
//  TwitterTutorial
//
//  Created by billy.cychan on 4/9/2021.
//

import UIKit

struct NotificationViewModel {
    
    private let notification: Notification
    private let type: NotificationType
    private let user: User
    
    var timestampString: String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        let now = Date()
        return formatter.string(from: notification.timestamp, to: now) ?? "2m"
    }
    
    var notificationMessage: String {
        switch type {
        case .follow: return " started following you"
        case .like: return " like your tweets"
        case .reply: return " replied to your tweet"
        case .retweet: return " retweet your tweet"
        case .mention: return " mentioned you in a tweet"
        }
    }
    
    var notificationText: NSAttributedString? {
        guard let timestamp = timestampString else { return nil }
        let attributedText = NSMutableAttributedString(string: user.username, attributes: [.font: UIFont.boldSystemFont(ofSize: 12)])
        attributedText.append(NSAttributedString(string: notificationMessage, attributes: [.font: UIFont.systemFont(ofSize: 12)]))
        
        attributedText.append(NSAttributedString(string: " \(timestamp)", attributes: [.font: UIFont.systemFont(ofSize: 12),
                                                                                       .foregroundColor: UIColor.lightGray]))
        
        return attributedText
    }
    
    var profileImageUrl: URL? {
        return user.profileImageUrl
    }
    
    var shouldideFollowingButton: Bool {
        return type != .follow
    }
    
    var followButtonText: String {
        return user.isFollowed ? "Following" : "Follow"
    }
    
    init(notification: Notification) {
        self.notification = notification
        self.type = notification.type
        self.user = notification.user
    }
}
