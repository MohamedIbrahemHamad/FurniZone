import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furnizone/Data/Models/profile_model.dart';
import 'package:furnizone/Logic/profile_cubit/profile_cubit.dart';
import 'package:furnizone/Presentation/Widgets/component_of_profile.dart';
import 'package:image_picker/image_picker.dart';
import 'privacy_and_policy.dart';
import 'terms_and_condition_page.dart';

class ProfilePage extends StatelessWidget {
  static String id = 'ProfilePage';
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileCubit>(context).GetProfileInfo();
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is ProfileIsLoading) {
          return Scaffold(
            backgroundColor:  Color(0xffDFDBDB),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is GetProfileSuccessfully || state is UploadProfileImage) {
          ProfileModel profileModel =
              BlocProvider.of<ProfileCubit>(context).profileModel;
          return Scaffold(
            backgroundColor: Color(0xffDFDBDB),
            body: ListView(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: const Text(
                    "My Profile",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff4A628A),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.topCenter,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              MemoryImage(profileModel.profilePicture!)),
                      Positioned(
                        left: 0,
                        top: 80,
                        child: CircleAvatar(
                          backgroundColor: Color(0xFF4A628A),
                          child: IconButton(
                            onPressed: () {
                              ImagePicker()
                                  .pickImage(source: ImageSource.gallery)
                                  .then((value) =>
                                      BlocProvider.of<ProfileCubit>(context)
                                          .UploadProfilePic(value!));
                            },
                            icon: Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    profileModel.fullName!,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff4A628A),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff828282),
                    ),
                  ),
                ),
                ComponentProfile(
                  text1: "Email",
                  text2: profileModel.email!,
                  icon1: Icons.email,
                  icon_background_color: Color(0xffC0CADC),
                  color: Color(0xff4A628A),
                ),
                ComponentProfile(
                  text1: 'Phone Number',
                  icon1: Icons.phone,
                  color: const Color(0xff1B94A1),
                  icon_background_color: const Color(0xffB7DFE3),
                  text2: profileModel.phone!,
                ),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Account',
                    style: TextStyle(
                      color: Color(0xff828282),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ComponentProfile(
                  text1: " Privacy & Policy",
                  icon1: Icons.lock,
                  icon2: Icons.arrow_forward_ios,
                  icon_background_color: Color(0xffC7E1F0),
                  color: const Color(0xff008BD9),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext) {
                      return PrivacyAndPolicy();
                    }));
                  },
                ),
                ComponentProfile(
                  text1: " Terms & Conditions",
                  icon1: Icons.error,
                  icon2: Icons.arrow_forward_ios,
                  icon_background_color: Color(0xffF9EBC5),
                  color: const Color(0xffFFCC47),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext) {
                      return TermsAndConditions();
                    }));
                  },
                ),
                ComponentProfile(
                  text1: " Log Out",
                  icon1: Icons.logout,
                  icon2: Icons.arrow_forward_ios,
                  icon_background_color: Color(0xffFBC7C7),
                  color: const Color(0xffF44545),
                  onTap: () {},
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );
        }
      },
    );
  }
}
