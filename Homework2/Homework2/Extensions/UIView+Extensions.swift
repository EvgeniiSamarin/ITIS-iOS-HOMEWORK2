//
//  UIView+Extensions.swift
//  Homework2
//
//  Created by Евгений Самарин on 03.10.2021.
//

import UIKit

extension UIView {

    // MARK: - Instance Methods

    func addSubviews(_ views: [UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }

    func pinToSuperView(sides: [Side] = Side.allSides) {
        guard let view = self.superview else { return }
        self.pin(sides: sides, to: view)
    }
    
    func pin(sides: [Side] = Side.allSides, to view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        for side in sides {
            switch side {
            case .top(let constant):
                self.topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true

            case .bottom(let constant):
                self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constant).isActive = true

            case .left(let constant):
                self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: constant).isActive = true

            case .right(let constant):
                self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: constant).isActive = true

            case .centerX(let constant):
                self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true

            case .centerY(let constant):
                self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
            }
        }
    }
    
    func pin(side: Side,to viewSide: ViewSide) {
        switch (side, viewSide) {
        case (.top(let constant), .top(let view)):
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true

        case (.top(let constant), .bottom(let view)):
            self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: constant).isActive = true

        case (.bottom(let constant), .top(let view)):
            self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true

        case (.bottom(let constant), .bottom(let view)):
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constant).isActive = true

        case (.left(let constant), .right(let view)):
            self.leftAnchor.constraint(equalTo: view.rightAnchor, constant: constant).isActive = true

        case (.left(let constant), .left(let view)):
            self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: constant).isActive = true

        case (.right(let constant), .right(let view)):
            self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: constant).isActive = true

        case (.right(let constant), .left(let view)):
            self.rightAnchor.constraint(equalTo: view.leftAnchor, constant: constant).isActive = true

        default:
            print("ERROR IN SET CONSTRAINT")
            break
        }
    }
    
    func setDemission(_ demission: Demission) {
        switch demission {
        case .height(let constant):
            self.heightAnchor.constraint(equalToConstant: constant).isActive = true

        case .width(let constant):
            self.widthAnchor.constraint(equalToConstant: constant).isActive = true
        }
    }
    
    func setEqualSize(constant: CGFloat) {
        self.heightAnchor.constraint(equalToConstant: constant).isActive = true
        self.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    func equal(_ demission: Demission, to view: UIView) {
        switch demission {
        case .height(let constant):
            self.heightAnchor.constraint(equalTo: view.heightAnchor, constant: constant).isActive = true

        case .width(let constant):
            self.widthAnchor.constraint(equalTo: view.widthAnchor, constant: constant).isActive = true
        }
    }
}

extension UIView {

    // MARK: - Instance Properties

    enum Side {

        // MARK: - Side Nested Types

        static let allSides: [Side] = [.top(0), .bottom(0), .left(0), .right(0)]
        static let top: Side = .top(0)
        static let bottom: Side = .bottom(0)
        static let right: Side = .right(0)
        static let left: Side = .left(0)
        static let centerX: Side = .centerX(0)
        static let centerY: Side = .centerY(0)
         
        case top(CGFloat)
        case bottom(CGFloat)
        case left(CGFloat)
        case right(CGFloat)
        case centerX(CGFloat)
        case centerY(CGFloat)
    }
    
    enum Demission {

        // MARK: - Demission Nested Types

        static let height: Demission = .height(0)
        static let width: Demission = .width(0)
        
        case height(CGFloat)
        case width(CGFloat)
    }
    
    enum ViewSide {

        // MARK: - ViewSide Nested Types

        case top(UIView)
        case bottom(UIView)
        case left(UIView)
        case right(UIView)
    }
}
