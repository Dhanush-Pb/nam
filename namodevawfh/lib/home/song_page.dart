import 'dart:async';
import 'dart:convert';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:spotify/spotify.dart' as spotify;
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:http/http.dart' as http;

class SongPage extends StatefulWidget {
  const SongPage({super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  static const String clientId = 'cb412eee87c74b38a1dd0f6e3aefa396';
  static const String clientSecret = 'c898e159e14b46d09ef99d3fe6c2d73e';
  static const String musicTrackId =
      '6rWblGW0pBcB3uygxBuWZV?si=7f4fc583f57647ba';
  final player = AudioPlayer();
  Duration? duration;
  String? songName;
  String? artistName;
  String? songImage;
  final Color myColor = Color.fromARGB(255, 20, 65, 82);

  var audi;
  List<Lyric>? lyrics;
  final ItemScrollController itemScrollController = ItemScrollController();
  StreamSubscription? streamSubscription;
  bool showLyrics = false;

  final ScrollOffsetController scrollOffsetController =
      ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();
  int currentLyricIndex = 0;

  @override
  void initState() {
    setState(() {});
    super.initState();
    fetchSongData();
  }

  Future<void> fetchSongData() async {
    final credentials = spotify.SpotifyApiCredentials(clientId, clientSecret);
    final spotifyApi = spotify.SpotifyApi(credentials);
    final track = await spotifyApi.tracks.get(musicTrackId);

    songName = track.name;
    artistName = track.artists?.first.name ?? "";
    songImage = track.album?.images?.first.url;

    if (songName != null) {
      final yt = YoutubeExplode();
      final video = (await yt.search.search("$songName $artistName")).first;
      final videoId = video.id.value;
      duration = video.duration;

      var manifest = await yt.videos.streamsClient.getManifest(videoId);
      audi = manifest.audioOnly.last.url;

      _initializeLyricsAndSubscription(player, songName!, artistName!);
      setState(() {});
    }
  }

  void _initializeLyricsAndSubscription(
      AudioPlayer player, String songName, String artistName) {
    streamSubscription = player.onPositionChanged.listen((duration) {
      if (lyrics != null) {
        int newIndex = lyrics!.indexWhere((lyric) =>
            lyric.timestamp.isAfter(DateTime(1970, 1, 1).add(duration)));
        if (newIndex != -1) {
          setState(() {
            currentLyricIndex = newIndex > 0 ? newIndex - 1 : 0;
            _scrollToCurrentLyric();
          });
        }
      }
    });

    fetchLyrics(songName, artistName);
  }

  void _scrollToCurrentLyric() {
    setState(() {
      if (itemScrollController.isAttached) {
        itemScrollController.scrollTo(
          index: currentLyricIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInCubic,
          alignment: 0.2,
        );
      }
    });
  }

  Future<void> fetchLyrics(String songTitle, String artistName) async {
    final apiKey = 'a4b507af272255aa1488b4eb10fd85d6';
    final url =
        'http://api.musixmatch.com/ws/1.1/matcher.lyrics.get?q_track=$songTitle&q_artist=$artistName&apikey=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final lyricsBody = data['message']['body']['lyrics']['lyrics_body'];
      lyrics = processLyrics(lyricsBody);
      setState(() {});
    } else {
      throw Exception('Failed to load lyrics');
    }
  }

  List<Lyric> processLyrics(String lyricsBody) {
    List<Lyric> processedLyrics = [];
    List<String> lines = lyricsBody.split('\n');
    Duration totalDuration = duration ?? const Duration(minutes: 4);
    Duration stepDuration =
        Duration(milliseconds: totalDuration.inMilliseconds ~/ lines.length);
    Duration currentTimestamp = Duration.zero;

    for (String line in lines) {
      if (line.trim().isNotEmpty) {
        processedLyrics.add(
            Lyric(line.trim(), DateTime(1970, 1, 1).add(currentTimestamp)));
        currentTimestamp += stepDuration;
      }
    }

    return processedLyrics;
  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 20, 65, 82),
        body: SafeArea(
            child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          showMiniPlayer = true;
                        });
                        _navigateToAnotherPage(context);
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          showMiniPlayer = true;
                        });
                      },
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                SizedBox(
                  height: screenSize.height * 0.40,
                  width: screenSize.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: songImage != null
                        ? Image.network(songImage!, fit: BoxFit.cover)
                        : const SizedBox.shrink(),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            songName ?? 'Unknown Title',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            artistName ?? 'Unknown Artist',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_circle_outline_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: screenSize.width * 0.9,
                  child: StreamBuilder<Duration>(
                    stream: player.onPositionChanged,
                    builder: (context, snapshot) {
                      return ProgressBar(
                        progress: snapshot.data ?? const Duration(seconds: 0),
                        total: duration ?? const Duration(minutes: 4),
                        bufferedBarColor: Colors.white60,
                        baseBarColor: Colors.grey,
                        thumbColor: Colors.white,
                        progressBarColor: Colors.white,
                        onSeek: (duration) {
                          player.seek(duration);
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        // Shuffle functionality
                      },
                      icon: const Icon(
                        Icons.shuffle,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Previous song functionality
                      },
                      icon: const Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        if (player.state == PlayerState.playing) {
                          await player.pause();
                        } else {
                          await player.play(UrlSource(audi.toString()));
                        }
                        setState(() {});
                      },
                      icon: Icon(
                        player.state == PlayerState.playing
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_fill_rounded,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Next song functionality
                      },
                      icon: const Icon(
                        Icons.skip_next,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Replay functionality
                      },
                      icon: const Icon(
                        Icons.replay,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Lyrics Section

                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 40),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(67, 141, 138, 138),
                    ),
                    height: 400,
                    child: StreamBuilder<Duration>(
                      stream: player.onPositionChanged,
                      builder: (context, snapshot) {
                        return ScrollablePositionedList.builder(
                          itemCount: lyrics?.length ?? 0,
                          itemBuilder: (context, index) {
                            final lyric = lyrics![index];
                            final isCurrentLyric = index == currentLyricIndex;
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Text(
                                lyric.line,
                                style: TextStyle(
                                  color: isCurrentLyric
                                      ? Colors.white
                                      : Colors.white38,
                                  fontSize: isCurrentLyric ? 20 : 18,
                                  fontWeight: isCurrentLyric
                                      ? FontWeight.w700
                                      : FontWeight.normal,
                                ),
                              ),
                            );
                          },
                          itemScrollController: itemScrollController,
                          scrollOffsetController: scrollOffsetController,
                          itemPositionsListener: itemPositionsListener,
                          scrollOffsetListener: scrollOffsetListener,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ])));
  }

  void _navigateToAnotherPage(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MiniPlayerPage(
        songImage: songImage,
        songName: songName,
        artistName: artistName,
        player: player,
        duration: duration,
        audi: audi,
        color: myColor,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Transition starts from the top
        const begin = Offset(0.0, -1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    ));
  }
}

class MiniPlayerPage extends StatefulWidget {
  final String? songImage;
  final String? songName;
  final String? artistName;
  final AudioPlayer? player;
  final Duration? duration;
  final dynamic audi;
  final Color? color;
  const MiniPlayerPage({
    super.key,
    this.songImage,
    this.songName,
    this.artistName,
    this.player,
    this.duration,
    this.audi,
    this.color,
  });

  @override
  _MiniPlayerPageState createState() => _MiniPlayerPageState();
}

class _MiniPlayerPageState extends State<MiniPlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            const Column(
              children: [
                SizedBox(height: 20),
                Row(
                  children: [],
                ),
                // Add more content for this page if needed
              ],
            ),
            if (showMiniPlayer)
              Positioned(
                left: 0,
                right: 0,
                bottom: 10,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: widget.color?.withOpacity(0.6),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: widget.songImage != null
                                    ? Image.network(
                                        widget.songImage!,
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      )
                                    : const SizedBox(width: 60, height: 60),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.songName ?? 'Unknown Title',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      widget.artistName ?? 'Unknown Artist',
                                      style: const TextStyle(
                                          color: Colors.white70),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  widget.player?.state == PlayerState.playing
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.white,
                                ),
                                onPressed: () async {
                                  if (widget.player?.state ==
                                      PlayerState.playing) {
                                    await widget.player?.pause();
                                  } else {
                                    await widget.player?.play(
                                        UrlSource(widget.audi.toString()));
                                  }
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          StreamBuilder<Duration>(
                            stream: widget.player?.onPositionChanged,
                            builder: (context, snapshot) {
                              return ProgressBar(
                                progress: snapshot.data ?? Duration.zero,
                                total: widget.duration ??
                                    const Duration(minutes: 4),
                                bufferedBarColor: Colors.white24,
                                baseBarColor: Colors.white10,
                                progressBarColor: Colors.white,
                                thumbColor: Colors.white,
                                barHeight: 3.0,
                                thumbRadius: 5.0,
                                onSeek: (duration) {
                                  widget.player?.seek(duration);
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class Lyric {
  final String line;
  final DateTime timestamp;

  Lyric(this.line, this.timestamp);
}

bool showMiniPlayer = false;
