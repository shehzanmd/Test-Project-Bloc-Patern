import 'package:flutter/material.dart';

const TWO_PI = 3.14 * 2;

class ClockTimerPage extends StatefulWidget {

  @override
  State<ClockTimerPage> createState() => _ClockTimerPageState();
}

class _ClockTimerPageState extends State<ClockTimerPage> with TickerProviderStateMixin{


  late AnimationController _controller;

  String get countText {
    Duration count = _controller.duration ! * _controller.value;
    return "${(count.inMinutes % 60).toString().padLeft(2,'0')}:${(count.inSeconds % 60).toString().padLeft(2,'0')}";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =AnimationController(vsync: this,duration: Duration(seconds: 30));
    _controller.reverse(from: _controller.value == 0 ? 1.0 : _controller.value);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = 200.0;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Progress Indicator"),
        ),
        body:Center(
          // This Tween Animation Builder is Just For Demonstration, Do not use this AS-IS in Projects
          // Create and Animation Controller and Control the animation that way.
          child: TweenAnimationBuilder(
            tween: Tween(begin: 1.0,end: 0.0),
            duration: Duration(seconds: 30),
            builder: (context,value,child){

              return Container(
                width: size,
                height: size,
                decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white,),
                child: Stack(
                  children: [
                    ShaderMask(
                      shaderCallback: (rect){
                        return SweepGradient(
                            startAngle: 0.0,
                            endAngle: TWO_PI,
                            stops: [value,value],
                            // 0.0 , 0.5 , 0.5 , 1.0
                            center: Alignment.center,
                            colors: [Colors.green.shade600,Colors.grey.withAlpha(55)]
                        ).createShader(rect);
                      },
                      child: Container(
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: Image.asset("asset/images/radial_scale.png").image)
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: size-45,
                        height: size-45,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                        ),
                        child: Center(child: AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("$countText",
                                style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                              Text("minutes remaining",
                                style: TextStyle(fontSize: 14,color: Colors.grey.shade500),),
                            ],
                          ),

                        )),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

}


