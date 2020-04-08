import UIKit
import ReactiveKit
import Bond

class ViewController: UIViewController {

    @IBOutlet weak var btwTabelView: UITableView!
    let viewModel = BSWModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.tableViewBind(tableView: btwTabelView)
        viewModel.fetchCategories()
    }
    
}

