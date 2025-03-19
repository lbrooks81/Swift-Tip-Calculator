import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet var billAmountTextField: UITextField!
    @IBOutlet var tipAmountLabel: UILabel!
    @IBOutlet var totalAmountLabel: UILabel!
    
    
    @IBAction func calculateTip(_ sender: UIButton)
    {
        let tipPercentage: String = sender.titleLabel!.text!
        var tipPercentageAsDouble: Double = 0
        
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
            default:
                break
        }
        
 
        
        let billAmount: Double = Double(billAmountTextField.text!) ?? -1
        
        if (billAmount != -1)
        {
            let tipAmount: Double = billAmount * tipPercentageAsDouble
            let totalAmount: Double = billAmount + tipAmount
            
            let tipAmountString: String = String(format: "%.2f", tipAmount)
        }
        else
        {
            billAmountTextField.placeholder = "Please enter a valid bill amount"
        }
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

