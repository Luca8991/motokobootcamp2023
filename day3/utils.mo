import Buffer "mo:base/Buffer";
import Array "mo:base/Array";

module {
  public func second_maximum(array : [Int]) : async Int {
    var max: Int = array[0];
    var second_max: Int = array[0];

    for (i in array.vals()) {
      if (i > max) {
        second_max := max;
        max := i;
      } else if (i > second_max) {
        second_max := i;
      }
    };

    return second_max;
  };

  public func remove_even(array : [Nat]) : [Nat] {
    Array.filter<Nat>(array, func (x : Nat) : Bool { x % 2 > 0 });
  };

  public func drop<T>(xs : [T], n : Nat) : [T] {
    let buf = Buffer.fromArray<T>(xs);

    let (_, res) = Buffer.split<T>(buf, n);

    return Buffer.toArray(res);
  };
}