String Login = '''
  query Login(\$email: String!, \$password: String!){
            login(email:\$email, password:\$password)
           {
              accountId
              token
           }
        }
   ''';

String Register = ''' 
        mutation CreateAccount(\$email: String!,\$password: String!,\$permission_id: ID!)
{
  createAccount(accountInput: {email: \$email,password:\$password,permission_id: \$permission_id} )  {
    _id
  }
}
                     ''';