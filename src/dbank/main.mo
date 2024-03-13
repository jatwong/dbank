import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  // currentValue := 300;

  let id = 12343234;
  // Debug.print(debug_show(id));

  stable var startTime = Time.now();
  // startTime := Time.now();
  Debug.print(debug_show (startTime));

  public func topUp(amount : Float) {
    currentValue += amount;
    // Debug.print(debug_show (currentValue));
  };

  // Allow users to withdraw an amount from the currentValue
  // Decrease the currentValue by the amount
  public func withdraw(amount : Float) {
    let tempValue : Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Amount is too large, currentValue is less than zero.");
    };
  };

  public query func checkBalance() : async Float {
    return currentValue;
  };

  // topUp();

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;

    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };
};
