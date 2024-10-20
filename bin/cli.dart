import 'dart:io';

class PackageInfo {
  // Declare class-level variables to store destination and weight
  String? destination;
  double? parsedWeight;

  // Method to get destination info
  void destinationInfo() {
    print('Please choose a destination: "ABC", "DEF", or "GHI."');
    destination =
        stdin.readLineSync(); // Store the result in the class variable
    if (destination != null && destination!.isNotEmpty) {
      destination = destination!.toUpperCase();
    }
  }

  // Method to get the weight
  void weight() {
    print('Please enter a package weight.');
    var weight = stdin.readLineSync();

    // Check if weight input is valid
    if (weight != null && weight.isNotEmpty) {
      try {
        parsedWeight = double.parse(weight);
      } on FormatException {
        // Handle invalid input for weight
        print('Please enter a valid number for weight.');
        return; // Exit the method if input is invalid
      }

      if (parsedWeight! < 0) {
        print('Please enter a positive number.');
        return; // Exit if the weight is negative
      }
    } else {
      print('Weight cannot be empty.');
      return; // Exit if weight input is empty
    }
  }

  // Method to print the entered details
  void printInfo() {
    if (destination != null &&
            destination!.isNotEmpty &&
            destination! == "ABC" ||
        destination == "DEF" ||
        destination == "GHI" &&
            parsedWeight != null &&
            parsedWeight! > 0 &&
            parsedWeight!.isNaN) {
      print(
          'Your input destination is "$destination" and your given weight is ${parsedWeight}KG');
    }
  }

  // Method to calculate the cost

  void calculateCost() {
    double costPerKg = 0;

    if (destination != null && destination!.isNotEmpty) {
      switch (destination) {
        case "ABC":
          costPerKg = 792;
          break;
        case "DEF":
          costPerKg = 948;
          break;
        case "GHI":
          costPerKg = 1003;
          break;
        default:
          print('Invalid destination');
          return;
      }
    }

    // Calculating total cost
    double totalCost = parsedWeight! * costPerKg;
    print('The total cost of shipment for "$destination" is: PKR $totalCost');
  }
}

void main() {
  PackageInfo package = PackageInfo();

  package.destinationInfo();
  package.weight();
  package.printInfo();
  package.calculateCost();
}
