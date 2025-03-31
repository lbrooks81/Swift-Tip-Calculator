import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet var billAmountTextField: UITextField!
    @IBOutlet var tipAmountLabel: UILabel!
    @IBOutlet var totalAmountLabel: UILabel!
    @IBOutlet var customTipPercentageSlider: UISlider!
    @IBOutlet var errorMessage: UILabel!
    @IBOutlet var tipPercentageLabel: UILabel!
    
    @IBAction func calculateTip(_ sender: UIButton)
    {
        let tipPercentage: String = sender.titleLabel!.text!
        var tipPercentageAsDouble: Double = 0
        customTipPercentageSlider.isHidden = true

        switch(tipPercentage)
        {
        case "10%":
            tipPercentageAsDouble = 0.1
            break
        case "15%":
            tipPercentageAsDouble = 0.15
            break
        case "20%":
            tipPercentageAsDouble = 0.20
            break
        case "Custom":
            customTipPercentageSlider.isHidden = false
            break
        default:
            customTipPercentageSlider.isHidden = true
            break
        }
        
        let billAmount: Double = Double(billAmountTextField.text!) ?? -1
        
        if (billAmount != -1)
        {
            if (errorMessage.isHidden == false)
            {
                errorMessage.isHidden = true
                errorMessage.text = ""
            }
            
            let tipAmount: Double = billAmount * tipPercentageAsDouble
            let totalAmount: Double = billAmount + tipAmount
            
            tipAmountLabel.text = "$" + String(format: "%.2f", tipAmount)
            totalAmountLabel.text = "$" + String(format: "%.2f", totalAmount)
        }
        else
        {
            errorMessage.isHidden = false
            errorMessage.text = "Please enter a valid bill amount"
        }
    }
    
    @IBAction func customTipPercentageConfirmed(_ sender: UIButton)
    {
        let billAmount: Double = Double(billAmountTextField.text!) ?? -1

        let tipAmount: Double = billAmount * Double(customTipPercentageSlider.value / 100)
        let totalAmount: Double = billAmount + tipAmount
        
        
        tipPercentageLabel.text = String(Int(customTipPercentageSlider.value)) + "%"
        tipAmountLabel.text = "$" + String(format: "%.2f", tipAmount)
        totalAmountLabel.text = "$" + String(format: "%.2f", totalAmount)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

