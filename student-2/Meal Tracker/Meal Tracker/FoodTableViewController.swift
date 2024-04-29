import UIKit

class FoodTableViewController: UITableViewController {
    
    var meals: [Meal] {
        let firstBreakfastFood = Food(name: "Pancakes", description: "Served with syrup and a dollop of whipped cream.")
        let secondBreakfastFood = Food(name: "Omelette", description: "Filled with cheese, mushrooms, and spinach.")
        let thirdBreakfastFood = Food(name: "Sausages", description: "Juicy and flavorful, perfect for breakfast.")
        let breakfast = Meal(name: "Morning Meal", food: [firstBreakfastFood, secondBreakfastFood, thirdBreakfastFood])
        let firstLunchFood = Food(name: "Salad", description: "Fresh greens with cherry tomatoes and balsamic vinaigrette.")
        let secondLunchFood = Food(name: "Soup", description: "Warm and comforting, ideal for a midday meal.")
        let thirdLunchFood = Food(name: "Sandwich", description: "Classic combination of turkey, lettuce, and mayo.")
        let lunch = Meal(name: "Midday Meal", food: [firstLunchFood, secondLunchFood, thirdLunchFood])
        let firstDinnerFood = Food(name: "Sushi", description: "Assorted rolls with wasabi and soy sauce.")
        let secondDinnerFood = Food(name: "Stir-Fry", description: "Fresh vegetables and tofu in a savory sauce.")
        let thirdDinnerFood = Food(name: "Grilled Salmon", description: "Rich in omega-3s and bursting with flavor.")
        let dinner = Meal(name: "Evening Meal", food: [firstDinnerFood, secondDinnerFood, thirdDinnerFood])

        return [breakfast, lunch, dinner]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let meal = meals[section]
        let food = meal.food
        
        return food.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        let meal = meals[indexPath.section]
        let food = meal.food[indexPath.row]
        
        // Configure the cell...
        var content = cell.defaultContentConfiguration()
        content.text = food.name
        content.secondaryText = food.description
        cell.contentConfiguration = content
        
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let meal = meals[section]
        return meal.name
    }
    
}
