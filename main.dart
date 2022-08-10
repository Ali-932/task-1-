//Main menu
// 1- Display all books
// 2- Display books with rate +4.
// 3- Add book
// 4- Update book
// 5- Delete book
// 6- Search
// Write your choice:
import 'dart:io';
import 'dart:math';

void main() {
  bool run = true;
  List books = [];
  while (run) {
    print('''Main menu
1- Display all books
2- Display books with rate +4.
3- Add book
4- Update book
5- Delete book
6- Search
Write your choice:''');
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        int i =0;
        for (Books book in books) {
          if (i==0){
          book.displayBooks(true);
          i++;}
          else
            book.displayBooks(false);

        }
        break;
      case '2':
        for (Books book in books) {
          if (book.rating >= 4) book.displayBooks(true);
        }
        break;
      case '3':
        try {
          print("Enter the count of books want to add:-");
          String? count = stdin.readLineSync();
          if (count != null) {
            int Count = int.parse(count);
            for (int i = 1; i <= Count; i++) {
              print('Enter book $i name');
              String? bookname = stdin.readLineSync();
              print('Enter book $i author');
              String? bookauthor = stdin.readLineSync();
              print('Enter book $i rate');
              String? rate = stdin.readLineSync();
              Map<String, dynamic> book = {
                'name': bookname,
                'author': bookauthor,
                'rate': rate
              };
              Books newBook = Books.fromMap(book);
              books.add(newBook);
            }
          } else {
            print("not valid");
          }
        } catch (e) {
          print('input not vaild');
        }
        break;

      case "4":
        {
          try {
            print("enter book name to update");
            String? bookname = stdin.readLineSync();
            print("enter new book name");
            String? new_name = stdin.readLineSync();
            Books book =
                books.firstWhere((element) => element.name == bookname);
            book.update_name = new_name!;
            print("enter new book author");
            String? new_author = stdin.readLineSync();
            book.update_author = new_author!;
            print("enter new book rating");
                String? new_rating = stdin.readLineSync();
            book.update_rating = new_rating!;
          } catch (e) {
            print("book not found");
          }
          break;
        }
      case '5':
        {
          try {
            print("enter book name to delete");
            String? bookname = stdin.readLineSync();
            Books book =
                books.firstWhere((element) => element.name == bookname);
            books.remove(book);
          } catch (e) {
            print("book not found");
          }
          break;
        }
      case '6':
        {
          print("enter book name to serach");
          String? bookname = stdin.readLineSync();
          try {
            Books book =
                books.firstWhere((element) => element.name == bookname);
            book.displayBooks(true);
          } catch (e) {
            print("book not found");
          }
        }
    }
  }
}

class Books {
  String name;
  String author;
  String rate;
  Books({required this.name, required this.author, required this.rate});

  Map<String, dynamic> get toMap =>
      {'name': name, 'author': author, 'rate': rate};

  static Books fromMap(Map<String, dynamic> data) => Books(
        name: data['name'],
        author: data['author'],
        rate: data['rate'],
      );
  void displayBooks(bool header) {
    if (header==true)
      print('''bookName\t\tbookAuthor\t\trate\n''');
    print('${this.name} \t\t ${this.author}\t\t ${this.rate}');
  }

  double get rating {
    double rat = double.parse(this.rate);
    return rat;
  }

  void set update_name(String Bookname) {
    this.name = Bookname;
  }

  void set update_author(String author) {
    this.author = author;
  }

  void set update_rating(String rate) {
    this.rate = rate;
  }
}
