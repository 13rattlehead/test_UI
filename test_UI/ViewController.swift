import UIKit 

class CounterViewController: UIViewController {
    
    var count = 0 {
        didSet {
            counterLabel.text = String(count)
            resetButton.isHidden = count == 0
        }
    }
    
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var valueSlider: UISlider!
    @IBOutlet weak var reduceButton: UIButton!
    @IBOutlet weak var allowNegativeNumbers: UISwitch!
    @IBOutlet weak var textCount: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        counterLabel.textColor = .black
        counterLabel.textAlignment = .center
        counterLabel.text = "0"
        addButton.setTitle("Add", for: .normal)
        resetButton.setTitle("Reset", for: .normal)
        reduceButton.setTitle("Reduce", for: .normal)
        
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
    
    @IBAction func inpurCountFromText(_ sender: UITextField) {
        let newCount = Int(readLine(strippingNewline: true)!)!
        count = newCount
    }
    @IBAction func switchDidChange(_ sender: UISwitch) {
        if (allowNegativeNumbers.isOn == true){
            reduceButton.isHidden = false
        }
        else {
            reduceButton.isHidden = true
            count = 0
        }
    }
}
    


