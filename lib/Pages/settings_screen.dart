import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screen_wake/flutter_screen_wake.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double brightness = 0.0;

  bool toogle = false;
  double currentvol = 0.5;
  @override
  void initState() {
    super.initState();

    initPlatFormBrightness();

    PerfectVolumeControl.hideUI =
        false; //set if system UI is hided or not on volume up/down
    Future.delayed(Duration.zero, () async {
      currentvol = await PerfectVolumeControl.getVolume();
      setState(() {
        //refresh UI
      });
    });

    PerfectVolumeControl.stream.listen((volume) {
      setState(() {
        currentvol = volume;
      });
    });
  }

  Future<void> initPlatFormBrightness() async {
    double bright;
    try {
      bright = await FlutterScreenWake.brightness;
    } on PlatformException {
      bright = 1.0;
    }
    if (!mounted) return;

    setState(() {
      brightness = bright;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFECABC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 60),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 138,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xff10CCCC),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white, width: 3)),
                child: Center(
                  child: Text(
                    "Settings",
                    style: GoogleFonts.roboto(
                      fontSize: 61,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      shadows: <Shadow>[
                        const Shadow(
                            offset: Offset(4.0, 4.0),
                            blurRadius: 0.5,
                            color: Colors.black26),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Brightness",
              style: GoogleFonts.roboto(
                fontSize: 45,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                shadows: <Shadow>[
                  const Shadow(
                      offset: Offset(4.0, 4.0),
                      blurRadius: 0.5,
                      color: Colors.black26),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 88),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    // width: 300,
                    height: 26,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      child: LinearProgressIndicator(
                        value: brightness,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xff10CCCC)),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  Slider(
                      thumbColor: Color(0xff10CCCC),
                      inactiveColor: Colors.transparent,
                      activeColor: Colors.transparent,
                      value: brightness,
                      onChanged: (value) {
                        setState(() {
                          brightness = value;
                        });

                        FlutterScreenWake.setBrightness(brightness);

                        if (brightness == 0) {
                          toogle = false;
                        } else {
                          toogle = true;
                        }
                      }),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Sound",
              style: GoogleFonts.roboto(
                fontSize: 45,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                shadows: <Shadow>[
                  const Shadow(
                      offset: Offset(4.0, 4.0),
                      blurRadius: 0.5,
                      color: Colors.black26),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 88),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    // width: 300,
                    height: 26,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      child: LinearProgressIndicator(
                        value: currentvol,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xff10CCCC)),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  Slider(
                    thumbColor: Color(0xff10CCCC),
                    inactiveColor: Colors.transparent,
                    activeColor: Colors.transparent,
                    value: currentvol,
                    onChanged: (newvol) {
                      currentvol = newvol;
                      PerfectVolumeControl.setVolume(newvol); //set new volume
                      setState(() {});
                    },
                    min: 0, //
                    max: 1,
                    divisions: 100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
