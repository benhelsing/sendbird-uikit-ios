//
//  SBUTheme.Deprecated.swift
//  SendbirdUIKit
//
//  Created by Jaesung Lee on 2022/10/25.
//  Copyright © 2022 Sendbird, Inc. All rights reserved.
//

import UIKit

@available(*, deprecated, renamed: "SBUGroupChannelListTheme") // 3.2.2
public typealias SBUChannelListTheme = SBUGroupChannelListTheme

@available(*, deprecated, renamed: "SBUGroupChannelCellTheme") // 3.2.2
public typealias SBUChannelCellTheme = SBUGroupChannelCellTheme

extension SBUTheme {
    @available(*, deprecated, renamed: "init(groupChannelListTheme:groupChannelCellTheme:openChannelListTheme:openChannelCellTheme:channelTheme:messageInputTheme:messageCellTheme:userListTheme:userCellTheme:channelSettingsTheme:userProfileTheme:componentTheme:overlayTheme:messageSearchTheme:messageSearchResultCellTheme:createOpenChannelTheme:)") // 3.2.2
    public convenience init(channelListTheme: SBUGroupChannelListTheme = .light,
                channelCellTheme: SBUGroupChannelCellTheme = .light,
                openChannelListTheme: SBUOpenChannelListTheme = .light,
                openChannelCellTheme: SBUOpenChannelCellTheme = .light,
                channelTheme: SBUChannelTheme = .light,
                messageInputTheme: SBUMessageInputTheme = .light,
                messageCellTheme: SBUMessageCellTheme = .light,
                userListTheme: SBUUserListTheme = .light,
                userCellTheme: SBUUserCellTheme = .light,
                channelSettingsTheme: SBUChannelSettingsTheme = .light,
                userProfileTheme: SBUUserProfileTheme = .light,
                componentTheme: SBUComponentTheme = .light,
                overlayTheme: SBUOverlayTheme = .init(),
                messageSearchTheme: SBUMessageSearchTheme = .light,
                messageSearchResultCellTheme: SBUMessageSearchResultCellTheme = .light,
                createOpenChannelTheme: SBUCreateOpenChannelTheme = .light
    ) {
        self.init(
            groupChannelListTheme: channelListTheme,
            groupChannelCellTheme: channelCellTheme,
            openChannelListTheme: openChannelListTheme,
            openChannelCellTheme: openChannelCellTheme,
            channelTheme: channelTheme,
            messageInputTheme: messageInputTheme,
            messageCellTheme: messageCellTheme,
            userListTheme: userListTheme,
            userCellTheme: userCellTheme,
            channelSettingsTheme: channelSettingsTheme,
            userProfileTheme: userProfileTheme,
            componentTheme: componentTheme,
            overlayTheme: overlayTheme,
            messageSearchTheme: messageSearchTheme,
            messageSearchResultCellTheme: messageSearchResultCellTheme,
            createOpenChannelTheme: createOpenChannelTheme
        )
    }
    
    @available(*, deprecated, renamed: "setGroupChannelList(channelListTheme:channelCellTheme:)") // 3.2.2
    public static func setChannelList(
        channelListTheme: SBUGroupChannelListTheme,
        channelCellTheme: SBUGroupChannelCellTheme
    ) {
        setGroupChannelList(
            channelListTheme: channelListTheme,
            channelCellTheme: channelCellTheme
        )
    }
    
    @available(*, deprecated, renamed: "groupChannelListTheme") // 3.2.2
    public static var channelListTheme: SBUGroupChannelListTheme {
        set { groupChannelListTheme = newValue }
        get { groupChannelListTheme }
    }
    
    @available(*, deprecated, renamed: "groupChannelCellTheme") // 3.2.2
    public static var channelCellTheme: SBUGroupChannelCellTheme {
        set { groupChannelCellTheme = newValue }
        get { groupChannelCellTheme }
    }
}

extension SBUMessageCellTheme {
    @available(*, deprecated, renamed: "unknownMessageDescLeftTextColor") // 3.2.2
    public var unknownMessageDescTextColor: UIColor {
        unknownMessageDescLeftTextColor
    }
    
    @available(*, deprecated, renamed: "init(backgroundColor:leftBackgroundColor:leftPressedBackgroundColor:rightBackgroundColor:rightPressedBackgroundColor:openChannelBackgroundColor:openChannelPressedBackgroundColor:dateFont:dateTextColor:dateBackgroundColor:userPlaceholderBackgroundColor:userPlaceholderTintColor:userNameFont:userNameTextColor:currentUserNameTextColor:timeFont:timeTextColor:pendingStateColor:failedStateColor:succeededStateColor:readReceiptStateColor:deliveryReceiptStateColor:userMessageFont:userMessageLeftTextColor:userMessageLeftEditTextColor:userMessageLeftHighlightTextColor:userMessageRightTextColor:userMessageRightEditTextColor:userMessageRightHighlightTextColor:fileIconBackgroundColor:fileImageBackgroundColor:fileImageIconColor:fileIconColor:fileMessageNameFont:fileMessageLeftTextColor:fileMessageRightTextColor:fileMessagePlaceholderColor:adminMessageFont:adminMessageTextColor:unknownMessageDescFont:unknownMessageDescTextColor:unknownMessageDescRightTextColor:ogTitleFont:ogTitleColor:ogDescriptionFont:ogDescriptionColor:ogURLAddressFont:ogURLAddressColor:openChannelOGTitleColor:linkColor:contentBackgroundColor:pressedContentBackgroundColor:quotedMessageBackgroundColor:quotedFileMessageThumbnailColor:quotedMessageTextColor:quotedMessageTextFont:repliedIconColor:repliedToTextColor:repliedToTextFont:mentionTextFont:mentionLeftTextColor:mentionRightTextColor:mentionLeftTextBackgroundColor:mentionRightTextBackgroundColor:buttonBackgroundColor:buttonTitleColor:sideButtonIconColor:newMessageBadgeColor:)") // [NXET_VERSION]
    public convenience init(
        backgroundColor: UIColor = SBUColorSet.background50,
        leftBackgroundColor: UIColor = SBUColorSet.background100,
        leftPressedBackgroundColor: UIColor = SBUColorSet.primary100,
        rightBackgroundColor: UIColor = SBUColorSet.primary300,
        rightPressedBackgroundColor: UIColor = SBUColorSet.primary400,
        openChannelBackgroundColor: UIColor = .clear,
        openChannelPressedBackgroundColor: UIColor = SBUColorSet.background100,
        dateFont: UIFont = SBUFontSet.caption1,
        dateTextColor: UIColor = SBUColorSet.ondark01,
        dateBackgroundColor: UIColor = SBUColorSet.overlay02,
        userPlaceholderBackgroundColor: UIColor = SBUColorSet.background300,
        userPlaceholderTintColor: UIColor = SBUColorSet.ondark01,
        userNameFont: UIFont = SBUFontSet.caption1,
        userNameTextColor: UIColor = SBUColorSet.onlight02,
        currentUserNameTextColor: UIColor = SBUColorSet.secondary300,
        timeFont: UIFont = SBUFontSet.caption4,
        timeTextColor: UIColor = SBUColorSet.onlight03,
        pendingStateColor: UIColor = SBUColorSet.primary300,
        failedStateColor: UIColor = SBUColorSet.error300,
        succeededStateColor: UIColor = SBUColorSet.onlight03,
        readReceiptStateColor: UIColor = SBUColorSet.secondary300,
        deliveryReceiptStateColor: UIColor = SBUColorSet.onlight03,
        userMessageFont: UIFont = SBUFontSet.body3,
        userMessageLeftTextColor: UIColor = SBUColorSet.onlight01,
        userMessageLeftEditTextColor: UIColor = SBUColorSet.onlight02,
        userMessageLeftHighlightTextColor: UIColor = SBUColorSet.onlight01,
        userMessageRightTextColor: UIColor = SBUColorSet.ondark01,
        userMessageRightEditTextColor: UIColor = SBUColorSet.ondark02,
        userMessageRightHighlightTextColor: UIColor = SBUColorSet.onlight01,
        fileIconBackgroundColor: UIColor = SBUColorSet.background50,
        fileImageBackgroundColor: UIColor = SBUColorSet.ondark01,
        fileImageIconColor: UIColor = SBUColorSet.onlight02,
        fileIconColor: UIColor = SBUColorSet.primary300,
        fileMessageNameFont: UIFont = SBUFontSet.body3,
        fileMessageLeftTextColor: UIColor = SBUColorSet.onlight01,
        fileMessageRightTextColor: UIColor = SBUColorSet.ondark01,
        fileMessagePlaceholderColor: UIColor = SBUColorSet.onlight02,
        adminMessageFont: UIFont = SBUFontSet.caption2,
        adminMessageTextColor: UIColor = SBUColorSet.onlight02,
        unknownMessageDescFont: UIFont  = SBUFontSet.body3,
        unknownMessageDescTextColor: UIColor = SBUColorSet.onlight02,
        unknownMessageDescRightTextColor: UIColor = SBUColorSet.ondark02,
        ogTitleFont:UIFont = SBUFontSet.body2,
        ogTitleColor:UIColor = SBUColorSet.onlight01,
        ogDescriptionFont:UIFont = SBUFontSet.caption2,
        ogDescriptionColor: UIColor  = SBUColorSet.onlight01,
        ogURLAddressFont: UIFont = SBUFontSet.caption2,
        ogURLAddressColor: UIColor = SBUColorSet.onlight02,
        openChannelOGTitleColor: UIColor = SBUColorSet.primary300,
        linkColor: UIColor = SBUColorSet.primary300,
        contentBackgroundColor: UIColor = SBUColorSet.background100,
        pressedContentBackgroundColor: UIColor = SBUColorSet.background300,
        quotedMessageBackgroundColor: UIColor = SBUColorSet.background100,
        quotedFileMessageThumbnailColor: UIColor = SBUColorSet.onlight02,
        quotedMessageTextColor: UIColor = SBUColorSet.onlight03,
        quotedMessageTextFont: UIFont = SBUFontSet.body3,
        repliedIconColor: UIColor = SBUColorSet.onlight03,
        repliedToTextColor: UIColor = SBUColorSet.onlight03,
        repliedToTextFont: UIFont = SBUFontSet.caption1,
        mentionTextFont: UIFont = SBUFontSet.body4,
        mentionLeftTextColor: UIColor = SBUColorSet.onlight01,
        mentionRightTextColor: UIColor = SBUColorSet.ondark01,
        mentionLeftTextBackgroundColor: UIColor = .clear,
        mentionRightTextBackgroundColor: UIColor = .clear,
        buttonBackgroundColor: UIColor = SBUColorSet.background200,
        buttonTitleColor: UIColor = SBUColorSet.primary300,
        sideButtonIconColor: UIColor = SBUColorSet.onlight03,
        newMessageBadgeColor: UIColor = SBUColorSet.secondary300
    ) {
        self.init(
            backgroundColor: backgroundColor,
            leftBackgroundColor: leftBackgroundColor,
            leftPressedBackgroundColor: leftPressedBackgroundColor,
            rightBackgroundColor: rightBackgroundColor,
            rightPressedBackgroundColor: rightPressedBackgroundColor,
            openChannelBackgroundColor: openChannelBackgroundColor,
            openChannelPressedBackgroundColor: openChannelPressedBackgroundColor,
            dateFont: dateFont,
            dateTextColor: dateTextColor,
            dateBackgroundColor: dateBackgroundColor,
            userPlaceholderBackgroundColor: userPlaceholderBackgroundColor,
            userPlaceholderTintColor: userPlaceholderTintColor,
            userNameFont: userNameFont,
            userNameTextColor: userNameTextColor,
            currentUserNameTextColor: currentUserNameTextColor,
            timeFont: timeFont,
            timeTextColor: timeTextColor,
            pendingStateColor: pendingStateColor,
            failedStateColor: failedStateColor,
            succeededStateColor: succeededStateColor,
            readReceiptStateColor: readReceiptStateColor,
            deliveryReceiptStateColor: deliveryReceiptStateColor,
            userMessageFont: userMessageFont,
            userMessageLeftTextColor: userMessageLeftTextColor,
            userMessageLeftEditTextColor: userMessageLeftEditTextColor,
            userMessageLeftHighlightTextColor: userMessageLeftHighlightTextColor,
            userMessageRightTextColor: userMessageRightTextColor,
            userMessageRightEditTextColor: userMessageRightEditTextColor,
            userMessageRightHighlightTextColor: userMessageRightHighlightTextColor,
            fileIconBackgroundColor: fileIconBackgroundColor,
            fileImageBackgroundColor: fileImageBackgroundColor,
            fileImageIconColor: fileImageIconColor,
            fileIconColor: fileIconColor,
            fileMessageNameFont: fileMessageNameFont,
            fileMessageLeftTextColor: fileMessageLeftTextColor,
            fileMessageRightTextColor: fileMessageRightTextColor,
            fileMessagePlaceholderColor: fileMessagePlaceholderColor,
            adminMessageFont: adminMessageFont,
            adminMessageTextColor: adminMessageTextColor,
            unknownMessageDescFont: unknownMessageDescFont,
            unknownMessageDescLeftTextColor: unknownMessageDescTextColor,
            unknownMessageDescRightTextColor: unknownMessageDescRightTextColor,
            ogTitleFont: ogTitleFont,
            ogTitleColor: ogTitleColor,
            ogDescriptionFont: ogDescriptionFont,
            ogDescriptionColor: ogDescriptionColor,
            ogURLAddressFont: ogURLAddressFont,
            ogURLAddressColor: ogURLAddressColor,
            openChannelOGTitleColor: openChannelOGTitleColor,
            linkColor: linkColor,
            contentBackgroundColor: contentBackgroundColor,
            pressedContentBackgroundColor: pressedContentBackgroundColor,
            quotedMessageBackgroundColor: quotedMessageBackgroundColor,
            quotedFileMessageThumbnailColor: quotedFileMessageThumbnailColor,
            quotedMessageTextColor: quotedMessageTextColor,
            quotedMessageTextFont: quotedMessageTextFont,
            repliedIconColor: repliedIconColor,
            repliedToTextColor: repliedToTextColor,
            repliedToTextFont: repliedToTextFont,
            mentionTextFont: mentionTextFont,
            mentionLeftTextColor: mentionLeftTextColor,
            mentionRightTextColor: mentionRightTextColor,
            mentionLeftTextBackgroundColor: mentionLeftTextBackgroundColor,
            mentionRightTextBackgroundColor: mentionRightTextBackgroundColor,
            buttonBackgroundColor: buttonBackgroundColor,
            buttonTitleColor: buttonTitleColor,
            sideButtonIconColor: sideButtonIconColor,
            newMessageBadgeColor: newMessageBadgeColor
        )
    }
}

