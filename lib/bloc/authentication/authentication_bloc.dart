import 'dart:async';

import 'package:ExpShop/bloc/authentication/authentication_event.dart';
import 'package:ExpShop/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

import '../data_repository.dart';

class AuthenticationBloc
{
      final _repository = DataRepository();
      final  _inputEventStream = BehaviorSubject<AuthenticationEvent>();
      final _userOutputStream = BehaviorSubject<User>();

      StreamSink<AuthenticationEvent> get inputStreamEvent => _inputEventStream.sink;
      Stream<User> get outputUserStream => _userOutputStream.stream;

      AuthenticationBloc()
      {
            void onLoginEvent(AuthenticationEvent authenticationEvent) async
            {
              User user;
                  if(authenticationEvent.requestUserRetrieval == true)
                    {
                          DocumentSnapshot documentSnapshot = await _repository.firebaseAPI.getUserWithToken(authenticationEvent.authenticationToken);
                          // user = User.fromJson(documentSnapshot.data());
                    }

              _userOutputStream.sink.add(user);
            }

            _inputEventStream.stream.listen(onLoginEvent);
      }

      @override
      void dispose()
      {
        _inputEventStream.close();
        _userOutputStream.close();
      }
}

final authenticationBloc = AuthenticationBloc();