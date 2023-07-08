import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../blocs/get_facts/get_facts_bloc.dart';
import '../first/components/big_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var appState = context.watch<MyAppState>();

    return const SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(30),
          //   child: Text('You have '
          //       '${appState.history.length} facts:'),
          // ),
          Expanded(
            child: HistoryListView(),
          ),
        ],
      ),
    );
  }
}

class HistoryListView extends StatefulWidget {
  const HistoryListView({Key? key}) : super(key: key);

  @override
  State<HistoryListView> createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  final _key = GlobalKey();
  static const Gradient _maskingGradient = LinearGradient(
    colors: [Colors.transparent, Colors.black],
    stops: [0.0, 0.5],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  Widget build(BuildContext context) {
    // final appState = context.watch<MyAppState>();
    final bloc = context.read<GetFactsBloc>();

    return StreamBuilder<GetFactsState?>(
        initialData: bloc.state,
        stream: bloc.stream,
        builder: (context, snapshot) {
          print(snapshot.data!.catshistoryList);
          return ShaderMask(
            shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
            blendMode: BlendMode.dstIn,
            child: AnimatedList(
              key: _key,
              reverse: true,
              padding: const EdgeInsets.only(top: 100),
              initialItemCount: snapshot.data!.catshistoryList.length,
              itemBuilder: (context, index, animation) {
                final pair = snapshot.data!.catshistoryList[index];
                print(pair);
                return SizeTransition(
                  sizeFactor: animation,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 20, right: 10, left: 10),
                    child: BigCard(
                      pair: pair,
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
