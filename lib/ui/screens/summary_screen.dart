import 'package:buksam_flutter_practicum/logic/blocs/books/books_bloc.dart';
import 'package:buksam_flutter_practicum/ui/widgets/book_info_dialog.dart';
import 'package:buksam_flutter_practicum/ui/widgets/markdown_with_footer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../logic/blocs/all_blocs.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  final player = AudioPlayer();

  bool isLoading = false;
  String? summaryAudioUrl;

  void play() async {
    if (summaryAudioUrl != null) {
      await player.setUrl(summaryAudioUrl!);
      player.play();
    }
  }

  Future<void> getAudio(String summary) async {
    final dio = Dio();

    try {
      setState(() {
        isLoading = true;
      });
      final response = await dio.post(
        "https://api.v7.unrealspeech.com/speech",
        data: {
          "Text": summary,
          "VoiceId": "Dan",
          "Bitrate": "192k",
          "Speed": "0",
          "Pitch": "1",
          "TimestampType": "sentence"
        },
        options: Options(headers: {
          "Authorization":
              "Bearer 8oAduIeCUREzE1UgSTcoxzF3HaLhbc2q8khfOHhEhuSYXPoZEceq93",
          "x-rapidapi-host": "open-ai-text-to-speech1.p.rapidapi.com",
          "Content-Type": "application/json",
        }),
      );

      print(response.data);
      summaryAudioUrl = response.data['OutputUri'];

      // final res = await dio.get(summaryAudioUrl!);
      // print(res.data);
    } on DioException catch (e) {
      print(e.response!.data);
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<GenerativeAiBloc, GenerativeAiStates>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  if (state is LoadedGenerativeAiState) {
                    showDialog(
                      context: context,
                      builder: (ctx) => BookInfoDialog(book: state.book),
                    );
                  }
                },
                icon: const Icon(Icons.info),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<GenerativeAiBloc, GenerativeAiStates>(
        builder: (context, state) {
          if (state is LoadedGenerativeAiState) {
            return Column(
              children: [
                Expanded(
                  child: MarkdownWithFooter(
                    markdownData: state.book.summary,
                    footer: const Icon(Icons.star),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () async {
                        await player.seek(
                          Duration(seconds: player.duration!.inSeconds - 3),
                        );
                      },
                      icon: const Icon(Icons.restore_sharp),
                    ),
                    IconButton(
                      onPressed: play,
                      icon: Icon(
                        player.playing ? Icons.pause : Icons.play_arrow,
                        size: 40,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await player.seek(
                          Duration(seconds: player.duration!.inSeconds + 3),
                        );
                      },
                      icon: const Icon(Icons.restore_sharp),
                    ),
                  ],
                ),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Slider(
                    value: 1,
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FilledButton.icon(
                        onPressed: () {
                          getAudio(state.book.summary);
                        },
                        label: const Text("Audio"),
                        icon: const Icon(Icons.play_arrow),
                      ),
                      BlocBuilder<BooksBloc, BooksState>(
                        builder: (context, booksState) {
                          if (booksState is LoadingBookState) {
                            return const CircularProgressIndicator();
                          }

                          return FilledButton.icon(
                            onPressed: () {
                              context
                                  .read<BooksBloc>()
                                  .add(AddBookEvent(state.book));
                            },
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                            label: const Text("Saqlash"),
                            icon: const Icon(Icons.bookmark),
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            );
          }
          return const Center(
            child: Text("Natija mavjud emas"),
          );
        },
      ),
    );
  }
}
