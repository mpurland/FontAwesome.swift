//
//  NSImage+FontAwesome.swift
//  FontAwesome
//
// Copyright (c) 2014-present FontAwesome.swift contributors
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


import AppKit

/// A FontAwesome extension to NSImage.
public extension NSImage {
    
    /// Get a FontAwesome image with the given icon name, text color, size and an optional background color.
    ///
    /// - parameter name: The preferred icon name.
    /// - parameter textColor: The text color.
    /// - parameter size: The image size.
    /// - parameter backgroundColor: The background color (optional).
    /// - returns: A string that will appear as icon with FontAwesome
    public class func fontAwesomeIconWithName(_ name: FontAwesome, textColor: NSColor, size: CGSize, backgroundColor: NSColor = NSColor.clear) -> NSImage {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = NSTextAlignment.center
        
        // Taken from FontAwesome.io's Fixed Width Icon CSS
        let fontAspectRatio: CGFloat = 1.28571429
        
        let fontSize = min(size.width / fontAspectRatio, size.height)
        let attributedString = NSAttributedString(string: String.fontAwesomeIconWithName(name), attributes: [NSFontAttributeName: NSFont.fontAwesomeOfSize(fontSize), NSForegroundColorAttributeName: textColor, NSBackgroundColorAttributeName: backgroundColor, NSParagraphStyleAttributeName: paragraph])
        
        let image = NSImage(size: size)
        image.lockFocus()
        //            UIGraphicsBeginImageContextWithOptions(size, false , 0.0)
        let rect = CGRect(x: 0, y: (size.height - fontSize) / 2, width: size.width, height: size.height)
        attributedString.draw(in: rect)
        image.unlockFocus()
        return image
    }
    
    /// Get a FontAwesome image with the given icon css code, text color, size and an optional background color.
    ///
    /// - parameter code: The preferred icon css code.
    /// - parameter textColor: The text color.
    /// - parameter size: The image size.
    /// - parameter backgroundColor: The background color (optional).
    /// - returns: A string that will appear as icon with FontAwesome
    public class func fontAwesomeIconWithCode(_ code: String, textColor: NSColor, size: CGSize, backgroundColor: NSColor = NSColor.clear) -> NSImage? {
        guard let name = String.fontAwesomeFromCode(code) else { return nil }
        return fontAwesomeIconWithName(name, textColor: textColor, size: size, backgroundColor: backgroundColor)
    }
}
