// Copyright (c) 2016, Mirego
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// - Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
// - Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
// - Neither the name of the Mirego nor the names of its contributors may
//   be used to endorse or promote products derived from this software without
//   specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

import UIKit

public extension UIView
{
    public func convertViewToImage(opaque: Bool = true) -> UIImage?
    {
        UIGraphicsBeginImageContextWithOptions(bounds.size, opaque, 0.0)

        guard let context = UIGraphicsGetCurrentContext() else { return nil }

        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

    /**
     Create a fade int animation using the view's alpha

     - parameter duration:
     - parameter delay:
     - parameter completion:
     */
    public func fadeIn(_ duration: TimeInterval = 0.4, delay: TimeInterval = 0.0, completion: ((Bool) -> Void)? = nil)
    {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)
    }

    /**
     Create a fade out animation using the view's alpha

     - parameter duration:
     - parameter delay:
     - parameter completion:
     */
    public func fadeOut(_ duration: TimeInterval = 0.4, delay: TimeInterval = 0.0, completion: ((Bool) -> Void)? = nil)
    {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }, completion: completion)
    }

    /**
     Set a view's shadow using a single call.

     - parameter radius:
     - parameter offset:
     - parameter opacity:
     - parameter color:
     */
    public func setShadow(radius: CGFloat = 3, offset: CGSize = CGSize(width: 1, height: 1), opacity: CGFloat = 0.5, color: UIColor = .black)
    {
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = Float(opacity)
    }

    /**
     Set round corners using a mask layer. This method of adding round corners are useful if want only few 
     corners to be rounded (e.g.: TopLeft and TopRight corners).
     
     WARNING: Note that if the bounds of the view change, the mask layer must be recomputed. So its a good
              idea to call this method from your layoutSubviews() method.

     - parameter corners: List of rounded corners
     - parameter radius:  Corners radius.
     */
    public func setRoundCornersMask(corners: UIRectCorner = .allCorners, radius: CGFloat = 3)
    {
        let mask = CAShapeLayer()
        mask.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        layer.mask = mask
    }

    /**
     Set the view's border.
     
     - parameter width: border's width. (Optional)
     - parameter color: border's color. (Optional)
     */
    public func setBorder(width: CGFloat? = nil, color: UIColor? = nil)
    {
        if let width = width {
            layer.borderWidth = width
        }

        if let color = color {
            layer.borderColor = color.cgColor
        }
    }
}
