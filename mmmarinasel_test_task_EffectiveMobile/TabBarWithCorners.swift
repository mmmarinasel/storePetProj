import UIKit

//@IBDesignable class TabBarWithCorners: UITabBar {
//    @IBInspectable var color: UIColor = #colorLiteral(red: 0.005033334251, green: 0, blue: 0.2081566453, alpha: 1)
//    @IBInspectable var radii: CGFloat = 30
//
//    private var shapeLayer: CALayer?
//
//    override func draw(_ rect: CGRect) {
//        self.addShape()
//    }
//
//    private func addShape() {
//        let shapeLayer = CAShapeLayer()
//
//        shapeLayer.path = self.createPath()
//        shapeLayer.strokeColor = #colorLiteral(red: 0.005033334251, green: 0, blue: 0.2081566453, alpha: 1).cgColor
//        shapeLayer.fillColor = color.cgColor
//        shapeLayer.lineWidth = 1
//        shapeLayer.shadowColor = #colorLiteral(red: 0.005033334251, green: 0, blue: 0.2081566453, alpha: 1).cgColor
//        shapeLayer.shadowOffset = CGSize(width: 0, height: -2)
//        shapeLayer.shadowOpacity = 0.21
//        shapeLayer.shadowRadius = 8
//        shapeLayer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radii).cgPath
//        self.tintColor = .white
//        if let oldShapeLayer = self.shapeLayer {
//            layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
//        } else {
//            layer.insertSublayer(shapeLayer, at: 0)
//        }
//
//        self.shapeLayer = shapeLayer
//    }
//
//    private func createPath() -> CGPath {
//        let path = UIBezierPath(roundedRect: bounds,
//                                byRoundingCorners: .allCorners,
//                                cornerRadii: CGSize(width: radii, height: 0.0))
//        return path.cgPath
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        self.isTranslucent = true
//        var tabFrame = self.frame
//        tabFrame.size.height = 65
//        tabFrame.origin.y = self.frame.origin.y + self.frame.height - 65
//        self.layer.cornerRadius = 18
//        self.frame = tabFrame
//        self.items?.forEach({ $0.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -5.0) })
//    }
//}
