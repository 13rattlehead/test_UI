import UIKit 

class CounterViewController: UIViewController {
    
    var count = 0 {
        didSet {
            counterLabel.text = String(count)
        }
    }

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var valueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        counterLabel.textColor = .black
        counterLabel.textAlignment = .center
        counterLabel.text = "0"
        addButton.setTitle("Add", for: .normal)
        resetButton.setTitle("Reset", for: .normal)
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
}

