import 'package:hive/hive.dart';

part'node.g.dart';


@HiveType(typeId: 0)
class Node{

 @HiveField(0)
  int iD ;

   @HiveField(1)
  int backID;

   @HiveField(2)
  int restartID;

   @HiveField(3)
  int noID;

   @HiveField(4)
  int yesID;

   @HiveField(5)
  String question ;

   @HiveField(6)
  String image;


   Node(this.iD, this.backID, this.restartID, this.yesID, this.noID, this.question, this.image);
}


