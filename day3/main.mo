import Book "./book";
import List "mo:base/List";

actor {
  var book: ?Book.Book = null;
  var books = List.nil<Book.Book>();

  public func add_book(title: Text, pages: Nat) : async () {
    let new_book: Book.Book = {
      title = title;
      pages = pages;
    };

    books := List.push(new_book, books);
  };

  public func get_books() : async [Book.Book] {
    List.toArray(books);
  };
}