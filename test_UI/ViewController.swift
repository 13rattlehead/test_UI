import UIKit

class CounterViewController: UIViewController, UITextFieldDelegate {
    
    var count = 0 {
        didSet {
            counterLabel.text = String(count)
            resetButton.isHidden = count == 0
            defaults.set(count, forKey: "count")
        }
    }
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var valueSlider: UISlider!
    @IBOutlet weak var reduceButton: UIButton!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var allowNegativeNumbers: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveCountValue()
        configureTextFieldDelegate()
        hideKeyboard()
        
        view.backgroundColor = .white
        counterLabel.textColor = .black
        counterLabel.textAlignment = .center
        counterLabel.text = "0"
        addButton.setTitle("Add", for: .normal)
        resetButton.setTitle("Reset", for: .normal)
        reduceButton.setTitle("Reduce", for: .normal)
    }
    
    override func touchesBegan(_ touches :Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }

    @IBAction func add(_ sender: UIButton) {
        count += 1
    }
    
    @IBAction func setValue(_ sender: UISlider) {
        count = Int(valueSlider.value)
    }
    @IBAction func reset(_ sender: UIButton) {
        count = 0
    }
    @IBAction func reduce(_ sender: UIButton) {
        count -= 1
    }
    
    func saveCountValue() {
        count = defaults.integer(forKey: "count")
        counterLabel.text = String(count)
    }
    
    //TextField
    
    @IBAction func inputNumber(_ sender: UITextField) {
        count = (Int(numberTextField.text!)!)
        counterLabel.text = numberTextField.text
     }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let stringValue = (textField.text ?? "0") + string
            count = Int(stringValue) ?? 0
            return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacmentString string: String) -> Bool{
        let inputValue = (textField.text ?? "0") + string
        count = Int(inputValue) ?? 0
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
            textField.text = ""
    }
    
    func configureTextFieldDelegate() {
         numberTextField.delegate = self
    }
    
    func hideKeyboard(){
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        let swipe = UISwipeGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        swipe.direction = .down
        
        view.addGestureRecognizer(tap)
        view.addGestureRecognizer(swipe)
    }
        
    //Switcher
    
    @IBAction func switchDidChange(_ sender: UISwitch) {
        if (allowNegativeNumbers.isOn == true){
            reduceButton.isHidden = false
        }
        else {
            reduceButton.isHidden = true
            if (count < 0) {
                count = 0
            }
        }
    }
}
    


