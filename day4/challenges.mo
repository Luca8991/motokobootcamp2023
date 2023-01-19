import List "mo:base/List";
import Principal "mo:base/Principal";
import Buffer "mo:base/Buffer";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";

type L<T> = List.List<T>;
type B<T> = Buffer.Buffer<T>;

actor {
  func unique<T>(l : L<T>, equal : (x : T, y : T) -> Bool) : L<T> {
    var res = List.nil<T>();

    List.iterate<T>(
      l,
      func(el : T) {
        switch (List.find<T>(res, func(el2 : T) { equal(el, el2) })) {
          case (null) {
            res := List.push<T>(el, res);
          };
          case (_) {};
        };
      },
    );

    return res;
  };

  func reverse<T>(l : L<T>) : L<T> {
    List.reverse<T>(l);
  };

  public shared ({ caller }) func is_anynomous() : async Bool {
    Principal.isAnonymous(caller);
  };

  func find_in_buffer<T>(buf : B<T>, val : T, equal : (x : T, y : T) -> Bool) : ?Nat {
    return Buffer.indexOf<T>(val, buf, equal);
  };

  let usernames = HashMap.HashMap<Principal, Text>(0, Principal.equal, Principal.hash);

  public shared ({ caller }) func add_username(name : Text) : async () {
    usernames.put(caller, name);
  };

  public func get_usernames() : async [(Principal, Text)] {
    return Iter.toArray(usernames.entries());
  };
};
