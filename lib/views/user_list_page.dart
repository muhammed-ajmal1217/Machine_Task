import 'package:flutter/material.dart';
import 'package:machinetask2/controller/provider.dart';
import 'package:machinetask2/model/data_model.dart';
import 'package:machinetask2/views/profile_pic_page.dart';
import 'package:provider/provider.dart';

class UserLists extends StatelessWidget {
  const UserLists({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: Consumer<UserListsProvdier>(
        builder: (context, value, child) => 
         FutureBuilder<List<DataModel>>(
          future: value.getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: value.userList.length,
                itemBuilder: (context, index) { 
                  DataModel user = snapshot.data![index];
                  return ListTile(
                    leading: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePicPage(profilePic: user.avatar??'',),));
                      },
                      child: CircleAvatar(
                        backgroundImage: user.avatar != null
                            ? NetworkImage(user.avatar!)
                            : const Icon(Icons.person) as ImageProvider
                      ),
                    ),
                    title: InkWell(
                      onTap: () => showSnackBar(context,"${user.firstName}' '${user.lastName}"),
                      child: Row(
                        children: [
                          Text("${user.firstName!}  ${user.lastName!}"),
                        ],
                      ),
                    ),
                    subtitle: Text(user.email??''),
                  );
                },
              );
            } else {
              return Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }
 showSnackBar(BuildContext context, String userName) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(userName),
      duration: Duration(seconds: 2),
    ),
  );
}

}
