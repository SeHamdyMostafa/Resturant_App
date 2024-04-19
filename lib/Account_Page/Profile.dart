import 'package:flutter/material.dart';
import 'package:restaurantapp/Account_Page/ProfileModel.dart';
import 'package:restaurantapp/Address_Page/Adress_Page.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/Account_Page/Edit_Profile_Page.dart';

class Profile extends StatelessWidget {
  Profile({super.key, required this.profileModel});
  ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: DeviceDimenssions.deviceHeight * .22,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        top: 20,
                        child: Container(
                          width: DeviceDimenssions.deviceWidth * .9,
                          height: DeviceDimenssions.deviceHeight * .18,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 205, 205, 205),
                                blurRadius: 6.0,
                                spreadRadius: 2.0,
                                offset: Offset(0.0, 0.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage("assets/myphoto.jpg"),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              profileModel.name,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              profileModel.email,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Text(
                      "Personal Details",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.phone_android,
                      color: Colors.orange,
                      size: 26,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "+20 ${profileModel.phone}",
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.transgender,
                      color: Colors.orange,
                      size: 26,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      profileModel.gender,
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.date_range,
                      color: Colors.orange,
                      size: 26,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      profileModel.pirthdate,
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                height: 5,
                color: Colors.orange,
                thickness: .5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Address",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const Address_Page();
                        }));
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.home_outlined,
                      color: Colors.orange,
                      size: 26,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: DeviceDimenssions.deviceWidth * .75,
                      child: Text(
                        profileModel.Address,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                height: 5,
                color: Colors.orange,
                thickness: .5,
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Edit_Profile(
                        profileModel: profileModel,
                      );
                    }));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: DeviceDimenssions.deviceHeight * .08,
                    width: DeviceDimenssions.deviceWidth * .6,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.orange),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: const Text("Edit Profile"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
