//
//  SBUMessageTemplate.Renderer+RenderStyles.swift
//  SendbirdUIKit
//
//  Created by Tez Park on 2022/10/14.
//  Copyright © 2024 Sendbird, Inc. All rights reserved.
//

import UIKit

extension SBUMessageTemplate.Renderer {
    // MARK: - ViewStyle
    func renderViewStyle(
        with item: SBUMessageTemplate.Syntax.View,
        to view: UIView
    ) {
        guard let viewStyle = item.viewStyle else {
            if item is SBUMessageTemplate.Syntax.TextButton {
                view.backgroundColor = self.themeForDefault.textButtonBackgroundColor
            }
            return
        }
        
        if item is SBUMessageTemplate.Syntax.CarouselItem {
            view.backgroundColor = .clear
            return
        }
        
        if let backgroundColor = viewStyle.backgroundColor {
            view.backgroundColor = UIColor(hexString: backgroundColor)
        } else if item is SBUMessageTemplate.Syntax.TextButton {
            view.backgroundColor = self.themeForDefault.textButtonBackgroundColor
        }
        
        if let backgroundImageUrl = viewStyle.backgroundImageUrl,
           let url = URL(string: backgroundImageUrl) {
            view.backgroundColor = UIColor(patternImage: UIImage(url: url))

        }
        if let borderWidth = viewStyle.borderWidth {
            view.layer.borderWidth = CGFloat(borderWidth)
        }
        if let borderColor = viewStyle.borderColor {
            view.layer.borderColor = UIColor(hexString: borderColor).cgColor
        }
    }
    
    // MARK: - ViewLayout
    func renderViewLayout(
        with item: SBUMessageTemplate.Syntax.View,
        to baseView: UIView,
        parentView: UIView,
        prevView: UIView,
        prevItem: SBUMessageTemplate.Syntax.View? = nil,
        itemsAlign: SBUMessageTemplate.Syntax.ItemsAlign? = .defaultAlign(),
        layout: SBUMessageTemplate.Syntax.LayoutType? = .column,
        isLastItem: Bool = false
    ) {
        var marginInsets: UIEdgeInsets = .zero
        if let margin = item.viewStyle?.margin {
            marginInsets = UIEdgeInsets(
                top: margin.top,
                left: margin.left,
                bottom: margin.bottom,
                right: margin.right
            )
        }
        
        // Size
        let width = item.width
        let height = item.height
        
        let horizontalAlign = itemsAlign?.horizontal ?? .left
        let verticalAlign = itemsAlign?.vertical ?? .top
        let subView = !baseView.subviews.isEmpty ? baseView.subviews[0] : nil
        
        // Size: width
        let padding = item.viewStyle?.padding
        let paddingWidth = (padding?.left ?? 0.0) + (padding?.right ?? 0.0)
        
        if width.type == .fixed {
            self.rendererConstraints += subView?.sbu_constraint_v2(width: CGFloat(width.value) - paddingWidth) ?? []
        } else {
            self.rendererConstraints += subView?.sbu_constraint_lessThan_v2(widthAnchor: baseView.widthAnchor, width: -paddingWidth) ?? []
        }

        // left/right
        if layout == .column { // default
            if width.type == .flex, width.value == flexTypeFillValue {
                // default
                self.rendererConstraints += baseView.sbu_constraint_v2(equalTo: parentView, centerX: 0)
                self.rendererConstraints += baseView.sbu_constraint_v2(equalTo: parentView, left: marginInsets.left)
                self.rendererConstraints += baseView.sbu_constraint_v2(equalTo: parentView, right: marginInsets.right)
            } else {
                /**
 
                 left:   |ㅁ----|
                 center: |--ㅁ--|
                 right:  |----ㅁ|
                 */
                
                switch horizontalAlign {
                case .left:
                    self.rendererConstraints += baseView.sbu_constraint_v2(equalTo: parentView, left: marginInsets.left)
                    self.rendererConstraints += baseView.sbu_constraint_v2(lessThanOrEqualTo: parentView, right: marginInsets.right)
                case .center:
                    self.rendererConstraints += baseView.sbu_constraint_v2(equalTo: parentView, centerX: 0)
                    self.rendererConstraints += baseView.sbu_constraint_v2(greaterThanOrEqualTo: parentView, left: marginInsets.left)
                    self.rendererConstraints += baseView.sbu_constraint_v2(lessThanOrEqualTo: parentView, right: marginInsets.right)
                case .right:
                    self.rendererConstraints += baseView.sbu_constraint_v2(greaterThanOrEqualTo: parentView, left: marginInsets.left)
                    self.rendererConstraints += baseView.sbu_constraint_v2(equalTo: parentView, right: marginInsets.right)
                }
            }
            
        } else { // row
            // left anchor
            if let prevItem = prevItem {
                let prevItemRightMargin = prevItem.viewStyle?.margin?.right ?? 0.0
                self.rendererConstraints += baseView.sbu_constraint_equalTo_v2(
                    leftAnchor: prevView.rightAnchor,
                    left: marginInsets.left + prevItemRightMargin
                )
            } else {
                self.rendererConstraints += baseView.sbu_constraint_v2(equalTo: parentView, left: marginInsets.left)
            }
            
            // right anchor
            if isLastItem {
                self.rendererConstraints += baseView.sbu_constraint_v2(equalTo: parentView, right: marginInsets.right)
            }
        }

        // MARK: - Body
        
        // Size: height
        let paddingHeight = (padding?.top ?? 0.0) + (padding?.bottom ?? 0.0)

        if height.type == .fixed {
            self.rendererConstraints += subView?.sbu_constraint_v2(height: CGFloat(height.value) - paddingHeight) ?? []
        } else {
            self.rendererConstraints += subView?.sbu_constraint_lessThan_v2(heightAnchor: baseView.heightAnchor, height: -paddingHeight) ?? []
        }
        
        // top/bottom
        if layout == .column { // Default
            // top anchor
            if prevItem == nil && prevView.tag != Self.sideViewTypeLeft {
                self.rendererConstraints += baseView.sbu_constraint_v2(equalTo: parentView, top: marginInsets.top)
            } else {
                let prevItemBottomMargin = prevItem?.viewStyle?.margin?.bottom ?? 0.0
                self.rendererConstraints += baseView.sbu_constraint_equalTo_v2(
                    topAnchor: prevView.bottomAnchor,
                    top: marginInsets.top + prevItemBottomMargin
                )
            }
            
            // bottom anchor
            if isLastItem {
                self.rendererConstraints += baseView.sbu_constraint_v2(equalTo: parentView, bottom: marginInsets.bottom)
            }
        } else { // row
            /**
                
             top  center  bottom
             --     --      --
             ㅁ      ㅣ      ㅣ
             ㅣ      ㅁ      ㅣ
             ㅣ      ㅣ      ㅁ
             --     --      --
             */

            if height.type == .flex, height.value == flexTypeFillValue {
                // default
                self.rendererConstraints += baseView.sbu_constraint_v2(equalTo: parentView, centerY: 0)
                self.rendererConstraints += baseView.sbu_constraint_v2(equalTo: parentView, top: marginInsets.top)
                self.rendererConstraints += baseView.sbu_constraint_v2(equalTo: parentView, bottom: marginInsets.bottom)
            } else {
                switch verticalAlign {
                case .top:
                    self.rendererConstraints += baseView.sbu_constraint_v2(equalTo: parentView, top: marginInsets.top)
                    self.rendererConstraints += baseView.sbu_constraint_v2(lessThanOrEqualTo: parentView, bottom: marginInsets.bottom)
                case .center:
                    self.rendererConstraints += baseView.sbu_constraint_v2(equalTo: parentView, centerY: 0)
                    self.rendererConstraints += baseView.sbu_constraint_v2(greaterThanOrEqualTo: parentView, top: marginInsets.top)
                    self.rendererConstraints += baseView.sbu_constraint_v2(lessThanOrEqualTo: parentView, bottom: marginInsets.bottom)
                case .bottom:
                    self.rendererConstraints += baseView.sbu_constraint_v2(equalTo: parentView, bottom: marginInsets.bottom)
                    self.rendererConstraints += baseView.sbu_constraint_v2(greaterThanOrEqualTo: parentView, top: marginInsets.top)
                }
            }
        }
        
        // Padding
        var paddingInsets = UIEdgeInsets.zero
        if let padding = item.viewStyle?.padding {
            paddingInsets = UIEdgeInsets(
                top: padding.top,
                left: padding.left,
                bottom: padding.bottom,
                right: padding.right
            )
        }
        if !baseView.subviews.isEmpty {
            self.rendererConstraints += subView?.sbu_constraint_v2(
                equalTo: baseView,
                left: paddingInsets.left,
                top: paddingInsets.top,
                bottom: paddingInsets.bottom,
                priority: .required
            ) ?? []

            // INFO: Edge case - for right padding constraint adjustment
            if let baseView = baseView as? SBUMessageTemplate.Renderer.BaseView,
               let rightPaddingConstraint = subView?.rightAnchor.constraint(equalTo: baseView.rightAnchor, constant: -paddingInsets.right) {
                baseView.rightPaddingConstraint = rightPaddingConstraint
                baseView.rightPaddingConstraint?.priority = .required
                
                if let baseViewRightPaddingConstraint = baseView.rightPaddingConstraint {
                    self.rendererConstraints += [baseViewRightPaddingConstraint]
                }
            }
        }
    }
    
    // MARK: - Action
    func setAction(
        on view: UIView,
        item: SBUMessageTemplate.Syntax.View
    ) {
        guard !view.subviews.isEmpty, let action = item.action else { return }
        let subView = view.subviews[0]
        
        if let button = subView as? ActionItemButton {
            button.action = action
            button.addTarget(self, action: #selector(didTapAction), for: .touchUpInside)
        } else {
            let tapGesture = ActionTapGesture(target: self, action: #selector(didTapActionGestures(_:)))
            tapGesture.action = action
            view.addGestureRecognizer(tapGesture)
            view.isUserInteractionEnabled = true
        }
    }
}
