


import 'package:fashionshop/src/bloc/checkout_bloc/checkout_event.dart';
import 'package:fashionshop/src/bloc/checkout_bloc/checkout_state.dart';
import 'package:fashionshop/src/config/GraphQLConfiguration.dart';
import 'package:fashionshop/src/model/OrderItem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:fashionshop/src/graphql/QueryMutation.dart';


GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  GraphQLClient _client = graphQLConfiguration.clientToQuery();


  @override
  // TODO: implement initialState
  CheckoutState get initialState =>
      isCheckoutingState(error: null);

  @override
  Stream<CheckoutState> mapEventToState(event) async* {
   if(event is OrderClickEvent)
     {
       yield LoadingState(error: state.error);

       QueryResult result = await _client.mutate(
           MutationOptions(
               documentNode: gql(createOrder),
               variables:
               {
                 "person_id":event.person_id ,
                 "price_ship":event.priceShip,
                 "total_price":event.totalPrice ,
                 "address": event.address,
                 "method_payment": event.methodPayment,
                 "carts": event.carts
               }
           )

       );
       if(result.hasException)
         yield isCheckoutingState(error: result.exception.toString());
       else yield isCheckoutingState(error: null);

     }
  }
}