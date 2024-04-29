
import UIKit

class FurnitureTableViewController: UITableViewController {

    struct PropertyKeys {
        static let furnitureCell = "FurnitureCell"
    }
    
    var rooms: [Room] = [
        Room(name: "Living Area",
             furniture: [Furniture(name: "Sofa", description: "Sink into luxury and relax."),
                         Furniture(name: "TV", description: "A window to endless entertainment."),
                         Furniture(name: "Coffee Table", description: "Perfect for resting snacks and drinks.")]),
        Room(name: "Cooking Space",
             furniture: [Furniture(name: "Range", description: "Prepare delicious meals with precision."),
                         Furniture(name: "Bakery", description: "Create mouthwatering pastries and desserts."),
                         Furniture(name: "Washbasin", description: "Keep your dishes sparkling clean.")]),
        Room(name: "Sleeping Quarters",
             furniture: [Furniture(name: "Bedstead", description: "Drift off into dreamland with comfort."),
                         Furniture(name: "Workstation", description: "Fuel productivity and inspiration."),
                         Furniture(name: "Wardrobe", description: "Organize your attire with elegance.")])]

    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return rooms.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms[section].furniture.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.furnitureCell, for: indexPath)
        
        
        let room = rooms[indexPath.section]
        let furniture = room.furniture[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = furniture.name
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return rooms[0].name
        case 1:
            return rooms[1].name
        case 2:
            return rooms[2].name
        default:
            return "Oops!"
        }
    }
    
    @IBSegueAction func showFurnitureDetail(_ coder: NSCoder, sender: Any?) -> FurnitureDetailViewController? {
        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else {
            return nil
        }
        
        let selectedRoom = rooms[indexPath.section]
        let selectedFurniture = selectedRoom.furniture[indexPath.row]
        
        return FurnitureDetailViewController(coder: coder, furniture: selectedFurniture)
    }    
}
