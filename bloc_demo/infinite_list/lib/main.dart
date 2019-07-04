import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:infinite_list/bloc/bloc.dart';
import 'package:infinite_list/widgets/bottom_loader.dart';
import 'package:infinite_list/widgets/post_widget.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infinite Scroll',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
        ),
        body: BlocProvider(
          builder: (BuildContext context) => 
            PostBloc(httpClient: http.Client())
              ..dispatch(Fetch()),
          child: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  PostBloc _postBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _postBloc = BlocProvider.of<PostBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _postBloc,
      builder: (BuildContext context, PostState state) {
        if (state is PostUninitialized) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is PostError) {
          return Center(
            child: Text('failed to fetch posts'),
          );
        }

        if (state is PostLoaded) {
          if (state.posts.isEmpty) {
            return Center(
              child: Text('no posts'),
            );
          }
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return index >= state.posts.length
                ? BottomLoader()
                : PostWidget(post: state.posts[index]);
            },
            itemCount: state.hasReachedMax
              ? state.posts.length
              : state.posts.length + 1,
            controller: _scrollController,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _postBloc.dispatch(Fetch());
    }
  }
}