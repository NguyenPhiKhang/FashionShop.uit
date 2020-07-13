String Login = '''
  query Login(\$email: String!, \$password: String!){
            login(email:\$email, password:\$password)
           {
              
              token
              account{
                person{
                  name
                }
              }
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
      icon
      name
      category_code
      image
      subCat{
        category_code
        name
        icon
      }
    }
  }
}

''';

String getProduct = '''
query getProduct(\$pageNumber:Int!,\$product_ids: [ID])
  {
  getProduct(pageNumber: \$pageNumber,product_ids:\$product_ids )
  {
    _id
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
		  _id
			option_size
      option_color
			amount
		}
    
    record_status
  }
}
''';


String getProductByCategory = ''' 
query GetProductByCategory(\$level_code: Int!,\$pageNumber: Int!,\$colors: [ID],\$sizes: [ID],\$price_min:Float!,\$price_max: Float!)
  {
  getProductByCategory(level_code: \$level_code,pageNumber: \$pageNumber,colors: \$colors,sizes: \$sizes,price_min: \$price_min,price_max: \$price_max)
  {
    _id
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
		  _id
			option_size
      option_color
			amount
		}
    
    record_status
  }
}
''';

String getCartItem = '''
query renderCart(\$cartInput: [CartInput]!)
{
  
  renderCart(cartInput: \$cartInput)
  {
    product{
      name
      img_url
      price
    }
    option_amount{
      option_size{
        name
        
      }
      option_color{
        name
      }
    }
    amount
    
  }
}
''';