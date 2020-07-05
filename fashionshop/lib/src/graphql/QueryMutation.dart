String Login = '''
  query Login(\$email: String!, \$password: String!){
            login(email:\$email, password:\$password)
           {
              
              token
           }
        }
   ''';

String Register = ''' 
       mutation CreateAccount(\$name: String!,\$email: String!,\$password: String!,\$permission_id: ID!)
{
  createAccount(accountInput: {name: \$name,email: \$email,password:\$password,permission_id: \$permission_id} )  {
    _id
  }
}
                     ''';


String GetAllCategories = '''
        query {
  getAllCategory(level: 1)
  {
    name
    
    subCat{
      name
      image
      subCat{
        name
        icon
      }
    }
  }
}
''';

String getProduct = '''
query getProduct(\$PageNumber:Int!)
  {
  getProduct(pageNumber: \$PageNumber)
  {
    name
    img_url
    images
    price
    promotion_percent
    final_price
    description
    rating_star{
      star1
    }
    stock_status
    is_freeship
    attribute{
      attribute{
        name
        
      }
      value{
    _id
    name
    }
    				}
    
		
		option_amount{
			option_size
      option_color
			amount
		}
    
    record_status
  }
}
''';
