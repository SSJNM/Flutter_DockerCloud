import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: MyHome(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    deactivated() {
      Fluttertoast.showToast(
        msg: "Currrently Unavailable",
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 20.0,
        backgroundColor: Colors.black,
      );
    }

    var helpicon = Icon(
      Icons.help,
      color: Colors.white,
    );

    var settingsicon = Icon(
      Icons.settings,
      color: Colors.white,
    );

    var mybutton1 = IconButton(
      icon: helpicon,
      onPressed: deactivated,
    );

    var mybutton2 = IconButton(
      icon: settingsicon,
      onPressed: deactivated,
    );
    var myappbar = AppBar(
      title: Title(
          color: Colors.white,
          child: Text(
            "Docker Cloud",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          )),
      backgroundColor: Colors.blue[800],
      leading: IconButton(
          icon: Icon(Icons.dehaze, color: Colors.white),
          onPressed: deactivated),
      actions: <Widget>[
        mybutton1,
        mybutton2,
      ],
    );

    var mybody = Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'images/docker2.png',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            Center(
              child: Card(
                margin: EdgeInsets.only(top: 50),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LaunchRoute()),
                    );
                  },
                  child: Container(
                    width: 300,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Launch a Container",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Card(
                margin: EdgeInsets.all(20),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ManageRoute()),
                    );
                  },
                  child: Container(
                    width: 300,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Manage Services",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );

    var myhome = Scaffold(
      appBar: myappbar,
      body: mybody,
    );

    return MaterialApp(
      home: myhome,
      debugShowCheckedModeBanner: false,
    );
  }
}

class LaunchRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    deactivated() {
      Fluttertoast.showToast(
        msg: "Currrently Unavailable",
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 20.0,
        backgroundColor: Colors.black,
      );
    }

    var myappbar = AppBar(
      title: Title(
          color: Colors.white,
          child: Text(
            "Launch a Container",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          )),
      backgroundColor: Colors.blue[800],
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHome()),
          );
        },
      ),
    );

    var mybody = Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'images/docker2.png',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            Center(
              child: Card(
                margin: EdgeInsets.only(top: 50),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuickLaunchRoute()),
                    );
                  },
                  child: Container(
                    width: 300,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Quick Launch",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Card(
                margin: EdgeInsets.all(20),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NormalContainerRoute()),
                    );
                  },
                  child: Container(
                    width: 300,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Launch Normally",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Card(
                margin: EdgeInsets.only(top: 200, left: 20, right: 20),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: deactivated,
                  child: Container(
                    width: 300,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Launch via Docker-Compose",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );

    var myhome = Scaffold(
      appBar: myappbar,
      body: mybody,
    );

    return MaterialApp(
      home: myhome,
      debugShowCheckedModeBanner: false,
    );
  }
}

String nodeip;
String script;
String osname;
String imagename;
var port;
String network;
String mountpoint;
String containerpoint;

web(nodeip, script, osname, imagename, port, network, mountpoint,
    containerpoint) async {
  var url =
      "http://${nodeip}/cgi-bin/${script}?imp1=${osname}&imp2=${imagename}&a=${port}&b=${network}&c=${mountpoint}&d=${containerpoint}";
  var response = await http.get(url);
  print(response.body);
}

class QuickLaunchRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myhome = Scaffold(
      appBar: AppBar(
        title: Text(
          "Quick Launch",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LaunchRoute()),
            );
          },
        ),
        backgroundColor: Colors.blue[300],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey[300],
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'images/docker.png',
                fit: BoxFit.contain,
              ),
            ),
            Column(
              children: <Widget>[
                Card(
                  margin: EdgeInsets.only(top: 30, left: 50, right: 50),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter the Image Name *',
                    ),
                    onChanged: (val) {
                      imagename = val;
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 10, left: 50, right: 50),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your for Container OS Name *',
                    ),
                    onChanged: (val) {
                      osname = val;
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 10, left: 50, right: 50),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter the port to be exported ',
                    ),
                    onChanged: (val) {
                      port = val;
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 10, left: 50, right: 50),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your Network Name ',
                    ),
                    onChanged: (val) {
                      network = val;
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 10, left: 50, right: 50),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter the Mount Point Address **',
                    ),
                    onChanged: (val) {
                      mountpoint = val;
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 10, left: 50, right: 50),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter the directory to be mounted **',
                    ),
                    onChanged: (val) {
                      containerpoint = val;
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 20),
                  child: FlatButton(
                    onPressed: () {
                      web(nodeip, script, osname, imagename, port, network,
                          mountpoint, containerpoint);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHome()),
                      );
                      Fluttertoast.showToast(
                        msg: "Container Launched",
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 5,
                        toastLength: Toast.LENGTH_SHORT,
                        fontSize: 20.0,
                        backgroundColor: Colors.black,
                      );
                    },
                    child: Text(
                      'Launch',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 40,
                  width: 350,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Text(' Note: * => Fields are Mandatory to be filled'),
                      Text('       ** => Fields are dependent on each other')
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );

    return MaterialApp(
      home: myhome,
      debugShowCheckedModeBanner: false,
    );
  }
}

class NormalContainerRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ManageRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    deactivated() {
      Fluttertoast.showToast(
        msg: "Currrently Unavailable",
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 20.0,
        backgroundColor: Colors.black,
      );
    }

    var myappbar = AppBar(
      title: Title(
          color: Colors.white,
          child: Text(
            "Manage Services",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          )),
      backgroundColor: Colors.blue[800],
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHome()),
          );
        },
      ),
    );

    var mybody = Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'images/docker2.png',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            Center(
              child: Card(
                margin: EdgeInsets.only(top: 50),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContainerRoute()),
                    );
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Containers",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Card(
                margin: EdgeInsets.all(20),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ImageRoute()),
                    );
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Images",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Card(
                margin: EdgeInsets.only(top: 200, left: 20, right: 20),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NetworkRoute()),
                    );
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Networking",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Card(
                margin: EdgeInsets.all(20),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VolumeRoute()),
                    );
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Volumes",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );

    var myhome = Scaffold(
      appBar: myappbar,
      body: mybody,
    );

    return MaterialApp(
      home: myhome,
      debugShowCheckedModeBanner: false,
    );
  }
}

class ContainerRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myhome = Scaffold(
      appBar: AppBar(
        title: Text(
          "Containers",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ManageRoute()),
            );
          },
        ),
        backgroundColor: Colors.blue[300],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey[300],
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'images/docker.png',
                fit: BoxFit.contain,
              ),
            ),
            Column(
              children: <Widget>[
                Center(
                  child: Card(
                    margin: EdgeInsets.only(top: 50),
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        //      ourscript = ""
                        web(nodeip, script, osname, imagename, port, network,
                            mountpoint, containerpoint);
                        Fluttertoast.showToast(
                          msg: "Data Retrieved",
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 5,
                          toastLength: Toast.LENGTH_SHORT,
                          fontSize: 20.0,
                          backgroundColor: Colors.black,
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Check Status for Running Containers",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    margin: EdgeInsets.all(20),
                    color: Colors.red,
                    child: InkWell(
                      splashColor: Colors.red,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TerminateRoute()),
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Terminate All Containers",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return MaterialApp(
      home: myhome,
      debugShowCheckedModeBanner: false,
    );
  }
}

class ImageRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myhome = Scaffold(
      appBar: AppBar(
        title: Text(
          "Containers",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ManageRoute()),
            );
          },
        ),
        backgroundColor: Colors.blue[300],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey[300],
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'images/docker.png',
                fit: BoxFit.contain,
              ),
            ),
            Column(
              children: <Widget>[
                Center(
                  child: Card(
                    margin: EdgeInsets.only(top: 50),
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        //      ourscript = ""
                        web(nodeip, script, osname, imagename, port, network,
                            mountpoint, containerpoint);
                        Fluttertoast.showToast(
                          msg: "Data Retrieved",
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 5,
                          toastLength: Toast.LENGTH_SHORT,
                          fontSize: 20.0,
                          backgroundColor: Colors.black,
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Check Status for Images on server",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    margin: EdgeInsets.all(20),
                    color: Colors.red,
                    child: InkWell(
                      splashColor: Colors.red,
                      onTap: () {
                        //      ourscript = ""
                        web(nodeip, script, osname, imagename, port, network,
                            mountpoint, containerpoint);
                        Fluttertoast.showToast(
                          msg: "Downloading Image",
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 5,
                          toastLength: Toast.LENGTH_SHORT,
                          fontSize: 20.0,
                          backgroundColor: Colors.black,
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Download any New image",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return MaterialApp(
      home: myhome,
      debugShowCheckedModeBanner: false,
    );
  }
}

class NetworkRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myhome = Scaffold(
      appBar: AppBar(
        title: Text("Networking"),
        backgroundColor: Colors.blue[300],
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'images/docker.png',
              fit: BoxFit.contain,
            ),
          ),
          Column(
            children: <Widget>[
              Card(
                margin: EdgeInsets.only(
                  top: 50,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter the IP of Docker Server',
                  ),
                  onChanged: (val) {
                    nodeip = val;
                  },
                ),
              ),
              Card(
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHome()),
                    );
                    Fluttertoast.showToast(
                      msg: "IP is set",
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      toastLength: Toast.LENGTH_SHORT,
                      fontSize: 20.0,
                      backgroundColor: Colors.black,
                    );
                  },
                  child: Text('Set IP'),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return MaterialApp(
      home: myhome,
      debugShowCheckedModeBanner: false,
    );
  }
}

class VolumeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myhome = Scaffold(
      appBar: AppBar(
        title: Text(
          "Volumes",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ManageRoute()),
            );
          },
        ),
        backgroundColor: Colors.blue[300],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey[300],
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'images/docker.png',
                fit: BoxFit.contain,
              ),
            ),
            Column(
              children: <Widget>[
                Center(
                  child: Card(
                    margin: EdgeInsets.only(top: 50),
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        //      ourscript = ""
                        web(nodeip, script, osname, imagename, port, network,
                            mountpoint, containerpoint);
                        Fluttertoast.showToast(
                          msg: "Data Retrieved",
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 5,
                          toastLength: Toast.LENGTH_SHORT,
                          fontSize: 20.0,
                          backgroundColor: Colors.black,
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Check Volmes on server",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    margin: EdgeInsets.all(20),
                    color: Colors.green,
                    child: InkWell(
                      splashColor: Colors.green,
                      onTap: () {
                        //      ourscript = ""
                        web(nodeip, script, osname, imagename, port, network,
                            mountpoint, containerpoint);
                        Fluttertoast.showToast(
                          msg: "Vomume Created ",
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 5,
                          toastLength: Toast.LENGTH_SHORT,
                          fontSize: 20.0,
                          backgroundColor: Colors.black,
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Create a Basic Volume",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return MaterialApp(
      home: myhome,
      debugShowCheckedModeBanner: false,
    );
  }
}

class TerminateRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myappbar = AppBar(
      title: Title(
          color: Colors.red,
          child: Text(
            "Warning !",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          )),
      backgroundColor: Colors.red,
    );

    var mybody = Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Container(
        height: 100,
        width: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              color: Colors.red,
              onPressed: () {
                        //      ourscript = ""
                        web(nodeip, script, osname, imagename, port, network,
                            mountpoint, containerpoint);                
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContainerRoute()),
                );
                Fluttertoast.showToast(
                  msg: "All containers terminated",
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  toastLength: Toast.LENGTH_SHORT,
                  fontSize: 20.0,
                  backgroundColor: Colors.black,
                );
              },
              child: Text(
                "Yes",
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            RaisedButton(
              color: Colors.green,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContainerRoute()),
                );
                Fluttertoast.showToast(
                  msg: "Operation Cancelled",
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  toastLength: Toast.LENGTH_SHORT,
                  fontSize: 20.0,
                  backgroundColor: Colors.black,
                );
              },
              child: Text(
                "No",
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    var myhome = Scaffold(
      appBar: myappbar,
      body: mybody,
    );

    return MaterialApp(
      home: myhome,
      debugShowCheckedModeBanner: false,
    );
  }
}
