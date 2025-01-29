// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/Home/Pages/Surah/Surah%20Cubit/surah_cubit_cubit.dart';
import 'package:quran_app/Shared/Shared_Components.dart';

class AudioOfSurahPage extends StatefulWidget {
  final int surahNumber;
  final int reciternumber;
  // final cubit;
  final String audioUrl;
  const AudioOfSurahPage(
      {super.key,
      required this.surahNumber,
      required this.reciternumber,
      // required this.cubit,
      required this.audioUrl});

  @override
  State<AudioOfSurahPage> createState() => _AudioOfSurahPageState();
}

class _AudioOfSurahPageState extends State<AudioOfSurahPage> {
  final player = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  String? audioUrl;
  // final audioPlayerurl= widget.cubit.audioOfSurah(widget.surahNumber, widget.reciternumber);
  @override
  void initState() {
    super.initState();
    player.setUrl(audioUrl = widget.audioUrl ??
        "https://download.quranicaudio.com/qdc/abdul_baset/mujawwad/1.mp3");
    player.positionStream.listen((p) {
      setState(() {
        position = p;
      });
    });
    player.durationStream.listen((d) {
      setState(() {
        duration = d!;
      });
    });
  }

  void dispose() {
    player.dispose();
    super.dispose();
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  void handleplaypause() {
    if (player.playing) {
      player.pause();
    } else {
      player.play();
    }
  }

  void handleSeek(double value) {
    // audioUrl = Url;
    player.seek(Duration(seconds: value.toInt()));
  }

  Widget build(BuildContext context) {
    final cubit = context.read<SurahCubitCubit>();
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 40.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  child: Image.asset(
                    'assets/AdobeStock_67150207_Preview.jpeg',
                    height: 300.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                " ❤️‍🔥 ${cubit.surahname.chapters?[widget.surahNumber - 1].nameArabic} ",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Slider(
                min: 0.0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds
                    .toDouble()
                    .clamp(0.0, duration.inSeconds.toDouble()),
                onChanged: handleSeek,
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatDuration(position),
                    ),
                    Text(
                      formatDuration(duration),
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 35.0,
                backgroundColor: DarkPurple,
                child: IconButton(
                  iconSize: 50,
                  icon: Icon(
                    player.playing ? Icons.pause : Icons.play_arrow,
                    color: Colors.purple[200],
                    // size: 40.0,
                  ),
                  onPressed: handleplaypause,
                ),
              ),
            ],
          ),
        ));
  }
}
