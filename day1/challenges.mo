actor {
  func multiply(n : Nat, m : Nat) : async Nat {
    return n * m;
  };

  func volume(n : Nat) : async Nat {
    return n * n * n;
  };

  func hours_to_minutes(n : Nat) : async Nat {
    return n * 60;
  };

  var counter : Nat = 0;

  func set_counter(n : Nat) : async () {
    counter := n;
  };

  func get_counter() : async Nat {
    return counter;
  };

  func test_divide(n: Nat, m : Nat) : async Bool {
    return m % n == 0;
  };

  func is_even(n : Nat) : async Bool {
    return n % 2 == 0;
  };
};
