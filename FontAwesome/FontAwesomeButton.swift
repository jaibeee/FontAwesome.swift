//
//  FontAwesomeButton.swift
//  FontAwesome
//
//  Created by Jai Bryan on 30/07/2016.
//
//

import UIKit

@IBDesignable class FontAwesomeButton: UIButton {

    @IBInspectable
    var iconCode:String = "" {
        didSet{
            self.iconView.text = String.fontAwesomeIconWithCode(iconCode)
        }
    }
    
    private var iconView:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    override func prepareForInterfaceBuilder() {
        setupViews()
    }
    
    
    /// Add a UILabel subview containing FontAwesome icon
    func setupViews(){
        self.iconView = UILabel()
        // Fits icon in the view
        iconView.font = UIFont.fontAwesomeOfSize(bounds.size.width < bounds.size.height ? bounds.size.width : bounds.size.height)
        iconView.textAlignment = NSTextAlignment.Center
        iconView.text = String.fontAwesomeIconWithCode(self.iconCode)
        iconView.textColor = self.tintColor
        self.addSubview(iconView)
    }
    
    override func tintColorDidChange() {
        iconView.textColor = self.tintColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds = true
        iconView.frame = CGRectMake(0, 0, bounds.size.width, bounds.size.height)
    }

}
