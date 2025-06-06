import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:whatsapp/payments.dart';
import 'package:whatsapp/qrscanner_page.dart';
import 'package:whatsapp/settings.dart';
import 'package:whatsapp/started_message.dart';
import 'linked_Device.dart';
import 'new_BroadCast.dart';
import 'new_Group.dart';
import 'package:image_picker/image_picker.dart';

class WhatsApp extends StatefulWidget {
  const WhatsApp({super.key});

  @override
  State<WhatsApp> createState() => _WhatsAppState() ;
}

class _WhatsAppState extends State<WhatsApp> {



  int _selectedIndex = 0;

  late List<dynamic> chats = [];
  bool isLoading = true;

  Future<void> fetchChats() async {
    final url = Uri.parse('https://683fd6cc5b39a8039a55cdd6.mockapi.io/api/c1/chats');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        chats = json.decode(response.body);
        _pages = [
          ChatList(chats: chats, isLoading: false,),
          StatusList(
            myStatus: mystatus,
            recentStatus: recentStatus,
            viewedStatus: viewedStatus,
          ),
          callsList(calls: calls),
        ];
      });
    } else {
      print("Failed to load chats: ${response.statusCode}");
    }
  }


  final Map<String, String> mystatus ={
    'Time':'Today, 8:00 AM',
    'Profile':'',
  };

  final List<Map<String, String>> recentStatus = [
    {
      'name':'Ram',
      'time':'10:00',
      'profile':'',
    },
    {
      'name':'Charan',
      'time':'09:00',
      'profile':'',
    },
    {
      'name':'Pawan',
      'time':'11:00',
      'profile':'',
    },
    {
      'name':'Kalyan',
      'time':'12:00',
      'profile':'',
    },
    {
      'name':'NTR',
      'time':'08:20',
      'profile':'',
    },
    {
      'name':'Mahesh',
      'time':'05:00',
      'profile':'',
    },
  ];

  final List<Map<String, String>> viewedStatus = [
    {
      'name':'Ram',
      'time':'10:00',
      'profile':'',
    },
    {
      'name':'Charan',
      'time':'09:00',
      'profile':'',
    },
    {
      'name':'Pawan',
      'time':'11:00',
      'profile':'',
    },
    {
      'name':'Kalyan',
      'time':'12:00',
      'profile':'',
    },
    {
      'name':'NTR',
      'time':'08:20',
      'profile':'',
    },
    {
      'name':'Mahesh',
      'time':'05:00',
      'profile':'',
    },
  ];

  final List<Map<String, String>> calls = [
    {
      'name':'Ram',
      'message':'Hi',
      'time':'10:00',
      'profile':'',
    },
    {
      'name':'Charan',
      'message':'Hello',
      'time':'09:00',
      'profile':'',
    },
    {
      'name':'Pawan',
      'message':'Janasena',
      'time':'11:00',
      'profile':'',
    },
    {
      'name':'Kalyan',
      'message':'Party',
      'time':'12:00',
      'profile':'',
    },
    {
      'name':'NTR',
      'message':'Tiger',
      'time':'08:20',
      'profile':'',
    },
    {
      'name':'Mahesh',
      'message':'Smart',
      'time':'05:00',
      'profile':'',
    },
    {
      'name':'Babu',
      'message':'Fab',
      'time':'04:00',
      'profile':'',
    },
    {
      'name':'Nani',
      'message':'Natural',
      'time':'01:00',
      'profile':'',
    },
    {
      'name':'Allu',
      'message':'Fire',
      'time':'02:00',
      'profile':'',
    }
  ];



  late List<Widget> _pages;



  @override
  void initState() {
    super.initState();
    _pages = [
      Center(child: CircularProgressIndicator()),
      StatusList(
        myStatus: mystatus,
        recentStatus: recentStatus,
        viewedStatus: viewedStatus,
      ),
      callsList(calls: calls),
    ];

    fetchChats();
  }


  void _onItemTapped (int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WhatsApp',style: TextStyle(color: Colors.green),),
        actions: [
          IconButton(
            icon: Icon(Icons.qr_code_scanner),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QRScannerScreen()),
              );
            },
          ),
          SizedBox(width: 30,),
          IconButton(
            icon: Icon(Icons.camera_alt_outlined),
            onPressed: () async {
              final ImagePicker picker = ImagePicker();
              await picker.pickImage(source: ImageSource.camera);

            },
          ),
          SizedBox(width: 30,),
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert),
            onSelected: (String value) async{
              if(value == "New group"){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> NewGroup())
                );

              }else if (value == 'New broadcast'){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> NewBroadCast())
                );

              }else if(value =='Linked device'){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> LinkedDevice())
                );

              }else if(value=='Started messages'){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> StartedMessage())
                );
              }else if(value == 'Payments'){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> Payments())
                );

              }else if(value =='Settings'){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> Settings())
                );

              }

            },
            itemBuilder: (BuildContext context)=>[
              PopupMenuItem(
                value: 'New group',
                child: Text('New group'),
              ),
              PopupMenuItem(
                  value: 'New broadcast',
                  child: Text('New broadcast')
              ),
              PopupMenuItem(
                  value: 'Linked device',
                  child: Text('Linked device')
              ),
              PopupMenuItem(
                  value: 'Started messages',
                  child: Text('Started messages')
              ),
              PopupMenuItem(
                  value: 'Payments',
                  child: Text('Payments')
              ),
              PopupMenuItem(
                value: 'Settings',
                child: Text('Settings'),
              ),
              PopupMenuItem(
                value: 'Logout',
                child: Text('Logout'),
              )
            ],
          ),
          SizedBox(width: 2,)
        ],
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon : Icon(Icons.search),
                    hintText: 'Ask meta AI or Search',
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none
                    )
                ),
              ),
            )
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat),label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.circle),label: 'Status'),
          BottomNavigationBarItem(icon: Icon(Icons.call),label: 'Calls'),

        ],
      ),
    );
  }
}
class ChatList extends StatelessWidget {
  final List<dynamic> chats;
  final bool isLoading;
  ChatList({required this.chats, required this.isLoading});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Chats")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
              radius: 25,
            ),
            title: Text(chat['name']!),
            subtitle: Text(chat['message']!),
            trailing: Text(chat['time']!),
            onTap: () {

            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.chat,color: Colors.white,),
      ),

    );
  }
}

class StatusList extends StatelessWidget {
  final Map<String, String> myStatus;
  final List<Map<String, String>> recentStatus;
  final List<Map<String, String>> viewedStatus;
  const StatusList({
    required this.myStatus,
    required this.recentStatus,
    required this.viewedStatus
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Stack(
            children: [
              CircleAvatar(
                radius: 25,
                child: Icon(Icons.person),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.add, size: 15, color: Colors.white,),
                ),
              )
            ],
          ),
          title: Text('My Status'),
          subtitle: Text(myStatus['Time']!),
          onTap: (){

          },
        ),
        Divider(),
        if(recentStatus.isNotEmpty) ...[
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('Recnet Updates',style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          ...recentStatus.map((status)=>ListTile(
            leading: CircleAvatar(radius: 25,child: Icon(Icons.person)),
            title: Text(status['name']!),
            subtitle: Text(status['time']!),
            onTap: (){},
          )),
        ],
        Divider(),
        if(viewedStatus.isNotEmpty)...[
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('Viewed Updated',style: TextStyle(fontWeight: FontWeight.bold),),),
          ...viewedStatus.map((status)=>ListTile(
            leading: CircleAvatar(radius: 25,child: Icon(Icons.person),
              backgroundColor: Colors.grey.shade300,),
            title: Text(status['name']!),
            subtitle: Text(status['time']!),
            onTap: (){
            },
          ))
        ]
      ],
    );
  }
}

class callsList extends StatelessWidget {
  final List<Map<String, String>> calls;
  const callsList({required this.calls});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: calls.length,
        itemBuilder: (context, index){
          final call = calls[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              child: Icon(Icons.person),
            ),
            title: Text(call['name']!),
            subtitle: Text(call['time']!),
            trailing: Icon(Icons.call),
            onTap: (){},
          );

        }
    );

  }
}