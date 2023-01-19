1. Is the heap memory saved when upgrading a canister? How much heap memory does a canister has?

No. The heap memory is 4GB per canister.

2. How much accounts can a unique Principal own?

2^32 accounts per Principal.

3. Can we safely upgrade a canister from interface A to interface B?

Interface A
```motoko
actor {
  public func greet(surname : Text, firstname : Text) : async Text {
    return "Hello" # firstname # surname # " !";
  };
}
```
Interface B
```motoko
actor {
  public func greet(firstname : Text) : async Text {
    return "Hello" # firstname # " !";
  };
}
```

No, because if you were calling the canister using the `greet` function, it won't throw errors (thanks to Candid, which automatically removes unused arguments) but what was the `surname` now is returned as the `firstname`.
