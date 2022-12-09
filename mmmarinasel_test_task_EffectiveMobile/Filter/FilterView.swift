import UIKit

class FilterView: UIView {
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var sizeTextField: UITextField!
    
//    var pickerView: UIPickerView = UIPickerView()
    
    
//    init() {
//        self.pickerView.delegate = self
//        self.pickerView.dataSource = self
//
//        self.brandTextField.inputView = self.pickerView
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 30
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    deinit {
//    }
}

//extension FilterView: UIPickerViewDelegate, UIPickerViewDataSource {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        <#code#>
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        <#code#>
//    }
//}

//struct FilterModel {
//    var prices: [Int]
//    var models: [String]
//}
