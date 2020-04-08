import Foundation
import ReactiveKit
import Bond
import Alamofire

class BSWModel {
    var categoryArray = MutableObservableArray<String>()
    
    let urlString = "https://blackstarshop.ru/index.php?route=api/v1/categories"
    
    
    func fetchCategories(){
        AF.request(urlString, method: .get).validate().responseJSON { (response) in
            let categories = try? JSONDecoder().decode([String: Category].self, from: response.data!)
            if !categories!.isEmpty {
                for cat in categories! {
                    self.categoryArray.append(cat.value.name)
                }
            }
        }
    }
    
    func tableViewBind(tableView: UITableView){
        categoryArray.bind(to: tableView) { (dataSource, indexPath, tableView) -> BSWTableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "bswCell") as! BSWTableViewCell
            cell.categoryLabel.text = dataSource[indexPath.row]
            return cell
        }
    }
    
    
}

struct CategoriesDecoder: Decodable {
    var categories : [Category]
}
struct Category: Decodable {
    var name : String
}

