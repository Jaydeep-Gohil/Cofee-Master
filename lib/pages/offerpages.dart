import 'package:flutter/material.dart';

class Offerpages extends StatelessWidget {
  const Offerpages({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Offer(name: "My Greate Offer Ever", description: "Buy one get One free "),
          Offer(name: "My Greate Offer Ever", description: "Buy one get One free "),
          Offer(name: "My Greate Offer Ever", description: "Buy one get One free "),
          Offer(name: "My Greate Offer Ever", description: "Buy one get One free "),
          Offer(name: "My Greate Offer Ever", description: "Buy one get One free "),
        ],
      ),
    );
  }
}

class Offer extends StatelessWidget {
  final String name;
  final String description;

  const Offer({super.key,required this.name,required this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.amber.shade50,
          elevation: 7,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(fit:BoxFit.cover,image: AssetImage("images/background.png",),)
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Container(
                      color: Colors.amber.shade50,
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(name,style: Theme.of(context).textTheme.headlineMedium,),
                  ))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Container(
                      color: Colors.amber.shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(description,style: Theme.of(context).textTheme.headlineSmall,),
                      ))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
