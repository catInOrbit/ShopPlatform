import 'dart:async';

import 'package:ExpShop/bloc/authentication/authentication_event.dart';
import 'package:ExpShop/bloc/data_repository.dart';
import 'package:ExpShop/bloc/global.dart';
import 'package:ExpShop/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class AuthenticationBloc
{
  final _repository = DataRepository();
      final  _inputEventStream = BehaviorSubject<AuthenticationEvent>();
      final _userOutputStream = BehaviorSubject<ShopUser>();

      StreamSink<AuthenticationEvent> get inputStreamEvent => _inputEventStream.sink;
      Stream<ShopUser> get outputUserStream => _userOutputStream.stream;

      AuthenticationBloc()
      {
            void onLoginEvent(AuthenticationEvent authenticationEvent) async
            {
              ShopUser user;
                  if(authenticationEvent.requestUserRetrieval == true)
                    {
                          print("AUTH TOKEN: " + authenticationEvent.authenticationToken);
                          QuerySnapshot documentSnapshot = await _repository.firebaseAPI.getUserWithToken(authenticationEvent.authenticationToken);
                          QueryDocumentSnapshot queryDocumentSnapshot = documentSnapshot.docs[0];

                          // if(documentSnapshot.exists)
                          //   {
                         user = ShopUser.Internal().UserFromJson(queryDocumentSnapshot.data());
                          currentUser = user;
                          print("Output sink added authentication");

                          _userOutputStream.sink.add(user);

                            // }


                    }

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