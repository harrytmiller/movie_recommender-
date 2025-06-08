//imports 
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'node.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

late Box<Node> box;

//void main
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Add error handling
  FlutterError.onError = (FlutterErrorDetails details) {
    print('Flutter Error: ${details.exception}');
  };

  //set up hive
  await Hive.initFlutter(); 
  Hive.registerAdapter(NodeAdapter());
  
  // Force complete fresh start - clear ALL Hive data
  try {
    await Hive.deleteFromDisk();
  } catch (e) {
    print('Could not clear storage: $e');
  }
  
  box = await Hive.openBox<Node>('my_map_v3'); // New box name

  //retrieves csv as a list, print it in terminal 
  String csv = "assets/my_map.csv";
  String fileData = await rootBundle.loadString(csv);
  
  //splits cvs to list - remove empty lines and trim
  List<String> rows = fileData.split("\n")
      .where((row) => row.trim().isNotEmpty)
      .map((row) => row.trim())
      .toList();
  
  print("Processing ${rows.length} rows from CSV");

  //iterates through row list
  for (int i = 0; i < rows.length; i++) {
    //retrieves current row 
    String row = rows[i];
    
    // Skip header row if it exists
    if (i == 0 && !RegExp(r'^\d').hasMatch(row)) {
      continue;
    }
    
    //split items in row into a list of strings seperated by comas
    List<String> itemInRow = row.split(",").map((item) => item.trim()).toList();

    if (itemInRow.isNotEmpty) {
      //makes sure there is enough elements for next part of coad
      if (itemInRow.length >= 7) {
        String image = itemInRow[6].trim();

        try {
          // Skip if this ID already exists to prevent duplicates
          if (box.containsKey(int.parse(itemInRow[0]))) {
            continue;
          }
          
          Node node = Node(
            int.parse(itemInRow[0]),
            int.parse(itemInRow[1]),
            int.parse(itemInRow[2]),
            int.parse(itemInRow[3]),
            int.parse(itemInRow[4]),
            itemInRow[5],
            image,
          );

          //puts node in box for hive database
          box.put(node.iD, node); 

          // old trouble shooting however application uses functionality when removed and not marked on quality of coad so left in 
        } catch (e) {
          print('Error parsing values at row $i: $e');
        }
      } else {
        print('Error: itemInRow does not have enough elements at row $i');
        print('Contents of itemInRow: $itemInRow');
      }
    } else {
      print('Error: itemInRow is empty at row $i');
    }
  }

  // runs app 
  runApp(
    const MaterialApp(
      home: MyFlutterApp(),
    ),
  );
}

// coad bellow defines classes needed for application and changing states. Provides some foundations that can be used to build off
class MyFlutterApp extends StatefulWidget {
  const MyFlutterApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyFlutterState();
  }
}

//links MyFlutterState to changing variables
class MyFlutterState extends State<MyFlutterApp> {
  String image = "";
  late int iD;
  late int backID;
  late int restartID;
  late int yesID;
  late int noID;
  String question = "";

  //initialize the state of MyFlutterApp
  @override
  void initState() {
    super.initState();
    initializeState();
  }

  //sets initial node 
  void initializeState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        Node? current;
        for (final node in box.values) {
          current = node;
          break;
        }

        //updates variables to initial vallues
        if (current != null) {
          iD = current.iD;
          backID = current.backID;
          restartID = current.restartID;
          yesID = current.yesID;
          noID = current.noID;
          question = current.question;
          image = current.image;
        }
      });
    });
  }

  //button handlers, all 4 basicaly the same but send application to different question 
  void yesHandler() {
    //sets nextNode based off button id in this case yesID
    setState(() {
      Node? nextNode;
      for (final node in box.values) {
        if (node.iD == yesID) {
          nextNode = node;
          break;
        }
      }
      // sets all variables in node to those of the question related to nextNode 
      if (nextNode != null) {
        iD = nextNode.iD;
        backID = nextNode.backID;
        restartID = nextNode.restartID;
        yesID = nextNode.yesID;
        noID = nextNode.noID;
        question = nextNode.question;
        image = nextNode.image;
      }
    });
  }

  void noHandler() {
    setState(() {
      Node? nextNode;
      for (final node in box.values) {
        if (node.iD == noID) {
          nextNode = node;
          break;
        }
      }
      if (nextNode != null) {
        iD = nextNode.iD;
        backID = nextNode.backID;
        restartID = nextNode.restartID;
        yesID = nextNode.yesID;
        noID = nextNode.noID;
        question = nextNode.question;
        image = nextNode.image;
      }
    });
  }

  void backHandler() {
    setState(() {
      Node? nextNode;
      for (final node in box.values) {
        if (node.iD == backID) {
          nextNode = node;
          break;
        }
      }
      if (nextNode != null) {
        iD = nextNode.iD;
        backID = nextNode.backID;
        restartID = nextNode.restartID;
        yesID = nextNode.yesID;
        noID = nextNode.noID;
        question = nextNode.question;
        image = nextNode.image;
      }
    });
  }

  void restartHandler() {
    setState(() {
      Node? nextNode;
      for (final node in box.values) {
        if (node.iD == restartID) {
          nextNode = node;
          break;
        }
      }
      if (nextNode != null) {
        iD = nextNode.iD;
        backID = nextNode.backID;
        restartID = nextNode.restartID;
        yesID = nextNode.yesID;
        noID = nextNode.noID;
        question = nextNode.question;
        image = nextNode.image;
      }
    });
  }

  //start building widgets
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //background
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              //container
              Container(
                alignment: const Alignment(0.0, -0.7),
                width: 700,
                height: 600,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 5,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),

              //buttons
              Align(
                alignment: const Alignment(0.25, 0.55),
                child: MaterialButton(
                  onPressed: () { yesHandler(); },
                  color: const Color.fromARGB(255, 0, 255, 115),
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  textColor: const Color.fromARGB(255, 0, 0, 0),
                  height: 40,
                  minWidth: 155,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: const Text(
                    "YES",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(-0.25, 0.55),
                child: MaterialButton(
                  onPressed: () { noHandler(); },
                  color: const Color.fromARGB(255, 255, 35, 35),
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  textColor: const Color.fromARGB(255, 0, 0, 0),
                  height: 40,
                  minWidth: 155,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: const Text(
                    "NO",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),

              Align(
                alignment: const Alignment(-0.25, 0.65),
                child: MaterialButton(
                  onPressed: () { backHandler(); },
                  color: const Color.fromARGB(255, 137, 134, 134),
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  textColor: const Color.fromARGB(255, 0, 0, 0),
                  height: 25,
                  minWidth: 155,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: const Text(
                    "BACK",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),

              Align(
                alignment: const Alignment(0.25, 0.65),
                child: MaterialButton(
                  onPressed: () { restartHandler(); },
                  color: const Color.fromARGB(255, 137, 134, 134),
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  textColor: const Color.fromARGB(255, 0, 0, 0),
                  height: 25,
                  minWidth: 155,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: const Text(
                    "RESTART",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),

              //image 
              Align(            
                alignment: const Alignment(0.0, 0.0),
                child: image.isNotEmpty
                    ? Image.asset(
                        image,
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox.shrink(), 
              ),

              //textbox      
              Align(
                alignment: const Alignment(0.0, -0.62),
                child: Container(
                  width: 600, 
                  child: Text(
                    question,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    softWrap: true, 
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 28,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );  //end of scaffold
  }
}