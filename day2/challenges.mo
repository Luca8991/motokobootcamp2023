import Text "mo:base/Text";
import Iter "mo:base/Iter";
import Array "mo:base/Array";
import Nat "mo:base/Nat";

actor {

  type Pattern = Text.Pattern;

  // Write a function average_array that takes an array of integers and returns the average value of the elements in the array.
  func average_array(array : [Int]) : async Int {
    var sum : Int = 0;
    for (i in array.vals()) {
      sum := sum + i;
    };

    return sum / array.size();
  };

  // Character count: Write a function that takes in a string and a character, and returns the number of occurrences of that character in the string.
  func count_character(t : Text, c : Char) : async Nat {
    var count : Nat = 0;
    for (i in t.chars()) {
      if (i == c) {
        count := count + 1;
      };
    };

    return count;

  };
  // Write a function factorial that takes a natural number n and returns the factorial of n.
  func factorial(n : Nat) : async Nat {
    var result : Nat = 1;
    let iter = Iter.range(1, n);

    for (i in iter) {
      result := result * i;
    };

    return result;
  };

  // Write a function number_of_words that takes a sentence and returns the number of words in the sentence.
  func number_of_words(t : Text) : async Nat {
    let p = #char(' ');
    let iter = Text.split(t, p);

    return Iter.size(iter);
  };

  // Write a function find_duplicates that takes an array of natural numbers and returns a new array containing all duplicate numbers. The order of the elements in the returned array should be the same as the order of the first occurrence in the input array.
  func find_duplicates(a : [Nat]) : async [Nat] {
    var result : [Nat] = [];
    var seen : [Nat] = [];

    for (i in a.vals()) {
      for (j in seen.vals()) {
        if (i == j) {
          // avoid duplicates in result
          var alreadyInResult: Bool = false;
          for (k in result.vals()) {
            if (i == k) {
              alreadyInResult := true;
            };
          };

          if (alreadyInResult == false) {
            result := Array.append(result, [i]);
          };
        };
      };

      seen := Array.append(seen, [i]);
    };

    return result;
  };

  // Write a function convert_to_binary that takes a natural number n and returns a string representing the binary representation of n.
  func convert_to_binary(n: Nat) : async Text {
    var num: Nat = n;
    var result: Text = "";

    while (num > 0) {
      let mod: Nat = num % 2;
      result := Nat.toText(mod) # result;

      num := num / 2;
    };

    return result;
  }
};
