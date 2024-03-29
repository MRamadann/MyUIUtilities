//
//  File.swift
//  
//
//  Created by Apple on 14/03/2024.
//

import UIKit

open class NibLoadingView: UIView {
  var nibView: UIView?
    
  public override init(frame: CGRect) {
    super.init(frame: frame)
    nibSetup()
  }
    
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    nibSetup()
  }
    
  private func nibSetup() {
    guard let view = loadViewFromNib() else { return }
    view.frame = bounds
    addSubview(view)
    nibView = view
    view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
  }
    
  private func loadViewFromNib() -> UIView? {
    let nibName = String(describing: type(of: self))
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: nibName, bundle: bundle)
    return nib.instantiate(withOwner: self, options: nil).first as? UIView
  }
}
