import 'dart:html';

import 'package:flutter/material.dart';
import 'package:music_player/utils/app_colors.dart';
import 'package:music_player/utils/constants.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  List<SongInfo> songs = [];

  Future<void> loadTracks() async {
    songs = await audioQuery.getSongs();
    setState(() {
      songs = songs;
    });
  }

  void initState(){
    super.initState();
    loadTracks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kwhite,
        leading: const Icon(
          Icons.music_note,
          color: kblue,
        ),
        title: const Text(
          "Music Player",
          style: TextStyle(
            color: primaryColor,
          ),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: songs.length,
        itemBuilder: (context, index) => ListTile(leading: CircleAvatar(backgroundImage:songs[index].
        albumArtwork==null?AssetImage(Constants.imageAssets('bg.jpg'):FileImage(File(songs[index].
        albumArtwork)),),title:Text(songs[index].title),subtitle:Text(songs[index].artist),onTap(){

        },),),
      ),
    );
  }
}

// /itemBuilder: (context,index)=>ListTile(leading: CircleAvatar(backgroundImage: songs[index].
          // albumArtwork ==null?AssetImage(Constants.imageAssets('bg.jpg'):FileImage(File(songs[index].
          // albumArtwork)),),title:Text(songs[index].title),subtitle:Text(songs[index].artist),onTap:(){

          // },),),