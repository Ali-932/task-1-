import 'dart:io';
import 'Books.dart';
void main() {
  bool run = true;
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
       Books.Displaybooks();
        break;
      case '2':
        Books.Display_books_4();

        break;
      case '3':
        Books.Add_books();
        break;

      case "4":
        {
         Books.update_book();
         break;
        }
      case '5':
        {
         Books.remove_book();
          break;
        }
      case '6':
        {
          Books.serach_book();
          }
        }
    }
  }



