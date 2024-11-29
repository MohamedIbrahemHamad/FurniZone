import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const Id = '/Home';
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: (MediaQuery.of(context).size.width) * .5,
              child: ElevatedButton(
                child: const Text('Home'),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
