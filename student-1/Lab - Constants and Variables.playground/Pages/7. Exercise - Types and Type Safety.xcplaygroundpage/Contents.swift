/*:
## Exercise - Types and Type Safety
 
 Declare two variables, one called `firstDecimal` and one called `secondDecimal`. Both should have decimal values. Look at both of their types by holding Option and clicking the variable name.
 */

var firstDecimal = 4.0
var secondDecimal = 7.3
//:  Declare a variable called `trueOrFalse` and give it a boolean value. Try to assign it to `firstDecimal` like so: `firstDecimal = trueOrFalse`. Does it compile? Print a statement to the console explaining why not, and remove the line of code that will not compile.


var trueOrFalse = true
//firstDecimal = trueOrFalse
print("trueOrFalse is a Bool and firstDecimal is a Double so their values cannot be changed.")
//:  Declare a variable and give it a string value. Then try to assign it to `firstDecimal`. Does it compile? Print a statement to the console explaining why not, and remove the line of code that will not compile.


var favoriteColor = "Blue"
//firstDecimal = favoriteColor
print("favoriteColor is a String and firstDecimal is a Double so their values cannot be changed.")
//:  Finally, declare a variable with a whole number value. Then try to assign it to `firstDecimal`. Why won't this compile even though both variables are numbers? Print a statement to the console explaining why not, and remove the line of code that will not compile.


var wholeNumber = 10
//firstDecimal = wholeNumber
print("One is int and other is double so they cannot be equalised.")
/*:
[Previous](@previous)  |  page 7 of 10  |  [Next: App Exercise - Tracking Different Types](@next)
 */
