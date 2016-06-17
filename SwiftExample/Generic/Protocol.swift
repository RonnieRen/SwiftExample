//
//  Protocol.swift
//  SwiftExample
//
//  Created by RonnieRen on 6/14/16.
//  Copyright © 2016 RonnieRen. All rights reserved.
//

import Foundation
import UIKit

public enum Error {
    case NetWorking
    case UnknowError
    case PermissonError
    case None
}
public protocol ColorCodedElement {
    func updateColor(error: Error)
}


extension ColorCodedElement where Self: UIView {
    public func updateColor(error: Error) {
        switch error {
        case .NetWorking:
            self.backgroundColor = UIColor.yellowColor()
        case .PermissonError:
            self.backgroundColor = UIColor.purpleColor()
        case .UnknowError:
            self.backgroundColor = UIColor.brownColor()
        default:
            self.backgroundColor = UIColor.greenColor()
        }
    }
}




extension UICollectionViewCell: ColorCodedElement {
    
}


public class TableViewCell: UITableViewCell, ColorCodedElement {
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    public init() {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
    }
    
    
}