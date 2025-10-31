import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phonecare/view_model/controller/login_provider.dart';

import '../../view_model/controller/darktheme_controller.dart';
class ProfileWeb extends ConsumerWidget {
  const ProfileWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(darkthemeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    final size = MediaQuery.of(context).size;
    final width = size.width;

    double fontSize;
    double containerHeight;
    double horizontalMargin;

    // Responsive adjustments only for Web or Desktop
      if (width < 600) {
        // Narrow browser window
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10, left: 10, top: 10),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: isDarkMode? Colors.black : Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        children: [
                          ClipOval(
                            child: Image.network(
                              "https://img.icons8.com/color/200/avatar.png",
                              width: 100,
                              height: 100,
                            ),
                          ),
                          SizedBox(width: 15,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Pradeep Singh",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: isDarkMode? Colors.white : Colors.black
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "demo@gmail.com",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: isDarkMode? Colors.white : Colors.black
                                ),
                              ),
                            ],
                          ),
                        ]
                    ),
                    SizedBox(width: 80,),
                    Padding(padding: EdgeInsets.only(right: 10),
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 10,),
              Text("Options", textAlign: TextAlign.left, style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: isDarkMode? Colors.white : Colors.black,

              )),
              SizedBox(height: 10,),
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: isDarkMode? Colors.black : Colors.white,
                  ),
                  child:Column(
                    children: [
                      _buildActionIcon("Your Orders",Icons.shopping_bag, (){
                        context.pushNamed("orders");
                      }),
                      _darkMode("Dark Mode", Icons.dark_mode,)

                    ],
                  )

              ),
              SizedBox(height: 10,),
              Text("Settings", textAlign: TextAlign.left, style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: isDarkMode? Colors.white : Colors.black,

              )),
              SizedBox(height: 10,),
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: isDarkMode? Colors.black : Colors.white,
                  ),
                  child:Column(
                    children: [

                      _buildActionIcon("Add Adddress",Icons.location_on_sharp, (){
                        context.pushNamed("address");
                      }),

                      _buildActionIcon("About Us",Icons.info_outline, (){}),

                    ],
                  )

              ),
              SizedBox(height: 10,),
              Text("Support", textAlign: TextAlign.left, style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: isDarkMode? Colors.white : Colors.black,

              )),
              SizedBox(height: 10,),
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: isDarkMode ? Colors.black : Colors.white,
                  ),
                  child:Column(
                    children: [
                      _buildActionIcon("Privacy Policy",Icons.privacy_tip, (){}),
                      _buildActionIcon("Help & Support", Icons.help_outline, (){}),
                      _buildActionIcon("Contact Us", Icons.phone, (){}),
                      _buildActionIcon("Logout", Icons.logout,  (){
                        //logout function calling
                        ref.read(loginTypeProvider.notifier).logout();
                        context.goNamed("login");
                      }),

                    ],
                  )

              ),



            ],
          ),
        );
      } else if (width < 1024) {
        // Medium screen (tablet-sized web)
        //fontSize = 22;
        //containerHeight = 70;
        //horizontalMargin = 20;

        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10, left: 10, top: 10),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: isDarkMode? Colors.black : Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        children: [
                          ClipOval(
                            child: Image.network(
                              "https://img.icons8.com/color/200/avatar.png",
                              width: 100,
                              height: 100,
                            ),
                          ),
                          SizedBox(width: 15,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Pradeep Singh",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: isDarkMode? Colors.white : Colors.black
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "demo@gmail.com",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: isDarkMode? Colors.white : Colors.black
                                ),
                              ),
                            ],
                          ),
                        ]
                    ),
                    SizedBox(width: 80,),
                    Padding(padding: EdgeInsets.only(right: 10),
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 10,),
              Text("Options", textAlign: TextAlign.left, style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: isDarkMode? Colors.white : Colors.black,

              )),
              SizedBox(height: 10,),
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: isDarkMode? Colors.black : Colors.white,
                  ),
                  child:Column(
                    children: [
                      _buildActionIcon("Your Orders",Icons.shopping_bag, (){
                        context.pushNamed("orders");
                      }),
                      _darkMode("Dark Mode", Icons.dark_mode,)

                    ],
                  )

              ),
              SizedBox(height: 10,),
              Text("Settings", textAlign: TextAlign.left, style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: isDarkMode? Colors.white : Colors.black,

              )),
              SizedBox(height: 10,),
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: isDarkMode? Colors.black : Colors.white,
                  ),
                  child:Column(
                    children: [

                      _buildActionIcon("Add Adddress",Icons.location_on_sharp, (){
                        context.pushNamed("address");
                      }),

                      _buildActionIcon("About Us",Icons.info_outline, (){}),

                    ],
                  )

              ),
              SizedBox(height: 10,),
              Text("Support", textAlign: TextAlign.left, style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: isDarkMode? Colors.white : Colors.black,

              )),
              SizedBox(height: 10,),
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: isDarkMode ? Colors.black : Colors.white,
                  ),
                  child:Column(
                    children: [
                      _buildActionIcon("Privacy Policy",Icons.privacy_tip, (){}),
                      _buildActionIcon("Help & Support", Icons.help_outline, (){}),
                      _buildActionIcon("Contact Us", Icons.phone, (){}),
                      _buildActionIcon("Logout", Icons.logout,  (){
                        //logout function calling
                        ref.read(loginTypeProvider.notifier).logout();
                        context.goNamed("login");
                      }),

                    ],
                  )

              ),



            ],
          ),
        );
      } else {
        // Wide screen / desktop
       // fontSize = 26;
        //containerHeight = 90;
        //horizontalMargin = 40;
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10, left: 10, top: 10),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: isDarkMode? Colors.black : Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        children: [
                          ClipOval(
                            child: Image.network(
                              "https://img.icons8.com/color/200/avatar.png",
                              width: 100,
                              height: 100,
                            ),
                          ),
                          SizedBox(width: 15,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Pradeep Singh",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: isDarkMode? Colors.white : Colors.black
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "demo@gmail.com",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: isDarkMode? Colors.white : Colors.black
                                ),
                              ),
                            ],
                          ),
                        ]
                    ),
                    SizedBox(width: 80,),
                    Padding(padding: EdgeInsets.only(right: 10),
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(right: 10, left: 10),
                          alignment: Alignment.centerLeft,
                          width: double.infinity,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: isDarkMode? Colors.black : Colors.white,
                          ),
                          child:Column(
                            children: [
                              Text("Options", textAlign: TextAlign.left, style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode? Colors.white : Colors.black,

                              )),
                              _buildActionIcon("Your Orders",Icons.shopping_bag, (){
                                context.pushNamed("orders");
                              }),
                              _darkMode("Dark Mode", Icons.dark_mode,)

                            ],
                          )

                      ),
                  ),

                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(right: 10, left: 10),
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: isDarkMode? Colors.black : Colors.white,
                          ),
                          child:Column(
                            children: [

                              _buildActionIcon("Add Adddress",Icons.location_on_sharp, (){
                                context.pushNamed("address");
                              }),

                              _buildActionIcon("About Us",Icons.info_outline, (){}),
                              _buildActionIcon("Privacy Policy",Icons.privacy_tip, (){}),

                            ],
                          )

                      ),
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [

                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(right: 10, left: 10),
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: isDarkMode ? Colors.black : Colors.white,
                          ),
                          child:Column(
                            children: [

                              _buildActionIcon("Help & Support", Icons.help_outline, (){}),
                              _buildActionIcon("Contact Us", Icons.phone, (){}),
                              _buildActionIcon("Logout", Icons.logout,  (){
                                //logut function calling
                                ref.read(loginTypeProvider.notifier).logout();
                                context.goNamed("login");
                              }),

                            ],
                          )

                      ),

                  ),

                ],
              ),


            ],
          ),
        );
      }


  }

  Widget _buildActionIcon(text,IconData icon,VoidCallback onTap, ){
    return Consumer(
        builder: (context, ref, _) {
          final themeMode = ref.watch(darkthemeProvider);
          final isDarkMode = themeMode == ThemeMode.dark;
          return GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20,top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(icon, color: isDarkMode? Colors.white : Colors.black,),
                  SizedBox(width: 20,),
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode? Colors.white : Colors.black
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          );
        }
    );
  }

  Widget _darkMode(text,IconData icon){

    return Consumer(
      builder: (context, ref, _) {
        final themeMode = ref.watch(darkthemeProvider);
        final isDarkMode = themeMode == ThemeMode.dark;
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20,top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: isDarkMode? Colors.white : Colors.black,),
              SizedBox(width: 20,),
              Text(
                text,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode? Colors.white : Colors.black
                ),
              ),
              Spacer(),
              Switch(value: isDarkMode, onChanged: (value){
                ref.read(darkthemeProvider.notifier).toggleTheme();
              })
            ],
          ),

        );
      },
    );
  }
}
