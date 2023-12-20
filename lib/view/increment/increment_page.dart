import 'package:flutter/material.dart';

class IncrementPage extends StatefulWidget {
  const IncrementPage({super.key});

  @override
  State<IncrementPage> createState() => _IncrementPageState();
}

class _IncrementPageState extends State<IncrementPage> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    print("****************  build1() **********************");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Increment Page"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              ElevatedButton(
                onPressed: () {
                  setState(() {
                    print("****************  setState() **********************");
                    number++;
                  });
                },
                child: const Text("Increment"),
              ),


              const SizedBox(height: 25),




              _SubWidget(number: number),
            ],
          ),
        ),
      ),
    );
  }
}

class _SubWidget extends StatefulWidget {
  const _SubWidget({required this.number});

  final int number;

  @override
  State<_SubWidget> createState() => _SubWidgetState();
}

class _SubWidgetState extends State<_SubWidget> {
  String number = "";

  @override
  void initState() {
    number = "Number : ${widget.number}";

    print("****************  initState() **********************");

    super.initState();
  }



  @override
  void didChangeDependencies() {
    // This method will be called when the dependencies change.
    // You can use it to fetch data from a provider or service.
    print("****************  didChangeDependencies() **********************");
    super.didChangeDependencies();
  }





  @override
  void didUpdateWidget(covariant _SubWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    //setState(() {
      number = "Number : ${widget.number}";
      print("****************  didUpdateWidget() **********************");
   // });
  }


  @override
  void deactivate() {
    // TODO: implement deactivate

    print("****************  deactivate() **********************");
    super.deactivate();
  }


  @override
  void dispose() {
    // TODO: implement dispose

    print("****************  dispose() **********************");
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    print("****************  build2() **********************");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          number,
          textAlign: TextAlign.center,
        ),

      ],
    );
  }
}
