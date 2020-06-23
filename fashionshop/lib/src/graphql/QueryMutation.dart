class QueryMutation
{
  String Login(String email,String password)
  {
    return '''
  query {
            login(email:"$email",password:"$password")
           {
              accountId
              token
           }
        }
                  ''';

  }

}