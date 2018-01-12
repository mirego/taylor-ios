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

extension UIImage
{
    @available(*, deprecated, message: "Use image(from: color) instead")
    public class func imageWithTintColor(_ color: UIColor) -> UIImage? {
        return UIImage.image(from: color)
    }

    /**
     Creates a new UIImage with the specified tint color.

     - parameter color: The image tint color
     - returns: New instance of UIImage
     */
    public class func image(from color: UIColor?) -> UIImage? {
        if let color = color {
            let rect = CGRect(origin: CGPoint.zero, size: CGSize(width: 1, height: 1))

            UIGraphicsBeginImageContext(rect.size)
            guard let context = UIGraphicsGetCurrentContext() else { return nil }
            context.setFillColor(color.cgColor)
            context.fill(rect)

            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return image
        }
        return nil
    }

    /**
     Creates a new instance of the image using the specified tint color.

     - parameter color: The image tint color
     - returns: New instance of UIImage
     */
    public func imageWithTintColor(_ color: UIColor) -> UIImage? {
        let sourceImage = withRenderingMode(.alwaysTemplate)

        UIGraphicsBeginImageContextWithOptions(size, false, sourceImage.scale)
        color.set()
        sourceImage.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return tintedImage
    }

    /**
     Resizes a new instance of an image resized with the specified width and height ratio

     - parameter widthRatio: The maximum desired image size in MB
     - returns: New instance of UIImage
     */
    public func resize(maxMbSize : CGFloat) -> UIImage? {
        guard let imageData: Data = UIImagePNGRepresentation(self) else { return nil }
        let imageSize: CGFloat = imageData.count.f // return image size in Bytes
        let desiredRatio: CGFloat = imageSize > maxMbSize ? maxMbSize / imageSize : 1
        return resize(widthRatio: desiredRatio, heightRatio: desiredRatio)
    }

    /**
     Resizes a new instance of an image resized with the specified width and height ratio

     - parameter widthRatio: The desired width ratio
     - parameter heightRatio: The desired height ratio
     - returns: New instance of UIImage
     */
    public func resize(widthRatio: CGFloat, heightRatio: CGFloat) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: self.size.width * widthRatio, height: self.size.height * heightRatio)
        return extractImage(in: rect)
    }

    private func extractImage(in rect: CGRect) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
