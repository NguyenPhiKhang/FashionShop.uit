String Login = '''
  query Login(\$email: String!, \$password: String!){
            login(email:\$email, password:\$password)
           {
              
              token
              account{
                person{
                  name
                  _id
                  avatar
                  number_phone
                  birthday
                  shipping_address
                  sex
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

//String getProduct = '''
//query getProduct(\$pageNumber:Int!,\$product_ids: [ID])
//  {
//  getProduct(pageNumber: \$pageNumber,product_ids:\$product_ids )
//  {
//    _id
//    name
//    img_url
//    images
//    price
//    promotion_percent
//    final_price
//    description
//    rating_star{
//      star1
//    }
//    stock_status
//    is_freeship
//    attribute{
//      attribute{
//        name
//
//      }
//      value{
//    _id
//    name
//    }
//    				}
//
//
//		option_amount{
//		  _id
//			option_size
//      option_color
//			amount
//		}
//
//    record_status
//  }
//}
//''';
String getProduct = '''
query getProduct(\$pageNumber:Int!,\$sort: Int!)
  {
  getProduct(pageNumber: \$pageNumber,sort: \$sort )
  {
    products{
    _id
    name
    img_url
    price
    promotion_percent
    final_price
    stock_status
    record_status
    }
  }
}
''';
String getProductDetail = '''
 query getProduct(\$id: ID!, \$person_id: ID!)
  {
  getProduct(id: \$id )
  { products{
    _id
    name
    images
    price
    promotion_percent
    final_price
    description
    
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
    isFavorite(person_id: \$person_id)
    record_status
  }
  }
  
}
''';


String getProductByCategory = ''' 
query GetProductByCategory(\$level_code: Int!,\$pageNumber: Int!,\$colors: [ID],\$sizes: [ID],\$price_min:Float!,\$price_max: Float!,\$sort: Int!)
  {
  getProductByCategory(level_code: \$level_code,pageNumber: \$pageNumber,colors: \$colors,sizes: \$sizes,price_min: \$price_min,price_max: \$price_max,sort:\$sort)
  {
    _id
    name
    img_url
    price
    promotion_percent
    final_price
    stock_status
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


String searchProduct =''' 
query searchProduct(\$text: String!,\$pageNumber: Int!,\$sort: Int!)
{
  searchProduct(text: \$text,pageNumber: \$pageNumber,sort: \$sort){
    products{
    _id
    name
    img_url
    price
    promotion_percent
    final_price
    stock_status
    record_status
    }
  }
}
''';


String getCart ='''
query getCart(\$person_id: ID!)
  {
  getCarts(person_id: \$person_id){
    _id
    product{
      name
      img_url
      final_price
    }
    amount
    option_amount{
      option_size{
        name
      }
      option_color{
        name
      }
      amount
    }
  }
}
''';

String addtoCart ='''
mutation addCart(\$person_id: ID!,\$product_id: ID!,\$option_amount_id: ID!, \$amount: Int! ){
  addCart(cartInput: {person_id: \$person_id, product_id: \$product_id, option_amount_id: \$option_amount_id, amount: \$amount})
  {
    _id
  }
}
''';

String updateCart = '''
mutation updateCart(\$id: ID!,\$amount: Int!) {
    updateCart(id: \$id, amount: \$amount)
  }
''';

String deleteCart = '''
mutation deleteCart(\$ids: [ID]!){ 
  deleteCart(ids: \$ids)
}
''';

String getFavorites ='''
query getFavorites(\$person_id: ID){
  getFavorites(person_id: \$person_id ){
     _id
    name
    img_url
    price
    promotion_percent
    final_price
    stock_status
    record_status
  }
}
''';

String actionFavorite= '''
mutation actionFavorite(\$person_id: ID,\$product_id: ID){
  actionFavorite(person_id: \$person_id, product_id: \$product_id)
}
''';


String createOrder= '''
mutation createOrder(\$person_id: ID!,\$price_ship: Float,\$total_price : Float, \$address : String,\$method_payment: String,\$carts: [ID])
{
  createOrder(orderInput:{
    	person_id: \$person_id,
    	price_ship: \$price_ship,
    	total_price: \$total_price,
    	address: \$address,
    	method_payment: \$method_payment,
    	carts: \$carts
		})
  
  {
    person{
      _id
    }
  }
    
}
''';


String getOrder = '''
 query getOrder(\$person_id: ID){
  getOrder(person_id: \$person_id)
  {
    _id
    price_ship
    total_price
    address
    method_payment
    carts{
        isReview
      _id
      product{
        name
        img_url
        final_price
      }
      option_amount{
        option_color{
          name
        }
        option_size{
          name
        }
      }
      amount
      
    }
    delivery_status
    shipping_unit
    createdAt
    
  }
}
''';


String createReview = '''
mutation createReview(\$cartItem_id: ID!,\$data: String!,\$images: [String],\$star: Int!)
{
  createReview(cartItem_id: \$cartItem_id,data: \$data, images: \$images,star: \$star)
  {
    _id
  }
  
}
''';