import 'dart:io';

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
  static List<Books> Bookslist=[];
  static Displaybooks(){
    int i = 0;
    for (Books book in Bookslist) {
      if (Bookslist.isEmpty==false) {
        if (i == 0) {
          book.displayBooks(true);
          i++;
        } else
          book.displayBooks(false);
      }
      else{
        print("no books to display");
      }
    }
  }
  void displayBooks(bool header) {
    if (header == true) print('''bookName\t\tbookAuthor\t\trate\n''');
    print('${this.name} \t\t ${this.author}\t\t ${this.rate}');
  }
  static Display_books_4(){
    for (Books book in Bookslist) {
      if (book.rating >= 4) book.displayBooks(true);
    }
  }
  static Add_books(){
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
          try{
            double float_rate= double.parse(rate!);
            if (float_rate>5) throw Exception("must be less than 5!");
          }
          catch (e){
            print("not valid rating");
            break;
          }

          Map<String, dynamic> book = {
            'name': bookname,
            'author': bookauthor,
            'rate': rate
          };
          Books newBook = Books.fromMap(book);
          Bookslist.add(newBook);
        }
      } else {
        print("not valid");
      }
    } catch (e) {
      print('input not vaild');
    }
  }
  static update_book(){
    try {
      print("enter book name to update");
      String? bookname = stdin.readLineSync();
      print("enter new book name");
      String? new_name = stdin.readLineSync();
      Books book =
      Bookslist.firstWhere((element) => element.name == bookname);
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
  }

  static remove_book(){
    try {
      print("enter book name to delete");
      String? bookname = stdin.readLineSync();
      Books book =
      Bookslist.firstWhere((element) => element.name == bookname);
      Bookslist.remove(book);
    } catch (e) {
      print("book not found");
    }
  }
  static serach_book(){
    print("enter book name to serach");
    String? bookname = stdin.readLineSync();
    try {
      Books book =
      Bookslist.firstWhere((element) => element.name.contains(bookname!));
      book.displayBooks(true);
    } catch (e) {
      print("book not found");
    }}

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