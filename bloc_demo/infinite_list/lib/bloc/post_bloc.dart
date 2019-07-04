import 'dart:async';
import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';

import 'package:infinite_list/bloc/bloc.dart';
import 'package:infinite_list/model/post.dart';


class PostBloc extends Bloc<PostEvent, PostState> {
  final http.Client httpClient;

  PostBloc({@required this.httpClient});

  @override
  PostState get initialState => PostUninitialized();

  // 可以进行的一项优化是去除事件，以防止不必要地滥用我们的API。
  // 覆盖 transform 允许我们在调用mapEventToState之前转换流。这允许使用distinct()、debounceTime()等操作。
  @override
  Stream<PostState> transform(
    Stream<PostEvent> events, 
    Stream<PostState> Function(PostEvent event) next
  ) {
    return super.transform(
      (events as Observable<PostEvent>).debounceTime(
        Duration(milliseconds: 500),
      ), 
      next
    );
  } 

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is Fetch && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PostUninitialized) {
          final posts = await _fetchPosts(0, 20);
          yield PostLoaded(posts: posts, hasReachedMax: false);
          return;
        }
        if (currentState is PostLoaded) {
          final state = currentState as PostLoaded;
          final posts = await _fetchPosts(state.posts.length, 20);
          yield posts.isEmpty 
            ? state.copyWith(hasReacedMax: true)
            : PostLoaded( 
              posts: state.posts + posts, 
              hasReachedMax: false,
            );
        }
      } catch (_) {
        yield PostError();
      }
    }
  }

  bool _hasReachedMax(PostState state) => 
    state is PostLoaded && state.hasReachedMax;

  Future<List<Post>> _fetchPosts(int startIndex, int limit) async {
    final response = await httpClient.get(
      'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit'
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((rawPost) {
        return Post(
          id: rawPost['id'],
          title: rawPost['title'],
          body: rawPost['body'],
        );
      }).toList();
    } else {
      throw Exception('error fetching posts');
    }
  }

}
