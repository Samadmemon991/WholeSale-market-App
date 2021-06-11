angular.module('starter.controllers', [])

.controller('DashCtrl', function($scope) {})

.controller('ChatsCtrl', function($scope, Chats) {
  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //
  //$scope.$on('$ionicView.enter', function(e) {
  //});

  $scope.chats = Chats.all();
  $scope.remove = function(chat) {
    Chats.remove(chat);
  };
})

.controller('ChatDetailCtrl', function($scope, $stateParams, Chats) {
  $scope.chat = Chats.get($stateParams.chatId);
})

.controller('AccountCtrl', function($scope) {
  $scope.settings = {
    enableFriends: true
  };
})

.controller('LoginCtrl', function($scope, $http,$state) {
  localStorage.setItem("cart",JSON.stringify([]));
    $scope.login = function(user){
      var data = {
        username: user.username,
        password: user.password,
      }
      $http.post('http://localhost/warehouse/login.php', JSON.stringify(data)).then(function(response){
        if(response.data.message == "loggedin"){
          localStorage.setItem("user", user.username )
          $state.go("home");
        }else{
          alert("Invalid Username or Password");
        }
      })
    }
})

.controller('RegisterCtrl', function($scope) {
  $scope.login = function(){
    //alert(1)
  }
})

.controller('ProductsCtrl', function($scope, $http, $stateParams,$ionicPopup,$state) {
  
      $http.get('http://localhost/warehouse/products.php?id='+$stateParams.catId).then(function(response){
        $scope.products = response.data;
      })

      $scope.addToCart = function(product){
        var cart = JSON.parse(localStorage.getItem("cart"));
        cart.push(product)
        localStorage.setItem("cart",JSON.stringify(cart));

        var myPopup = $ionicPopup.show({
          title: product.Product_name,
          subTitle: 'Added Successfully!',
          scope: $scope,
       
          buttons: [
             { text: 'Continue Shopping' }, {
                text: '<b>View Cart</b>',
                type: 'button-positive',
                onTap: function(e) {
                  $state.go("cart")
                }
             }
          ]
       });

      }
})

.controller('HomeCtrl', function($scope,$http) {
  
  $http.get('http://localhost/warehouse/categories.php').then(function(response){
        $scope.cats = response.data;
      })

})

.controller('CartCtrl', function($scope,$http,$ionicPopup,$state) {
  
  $scope.products = JSON.parse(localStorage.getItem("cart"));
  var products = JSON.parse(localStorage.getItem("cart"));
  var price = 0;
  products.forEach(element => {
    price += parseInt(element.Product_SPrice);
  });

  $scope.total = price;
  $scope.placeOrder = function(){
    var data = {customer: localStorage.getItem("user"), products:localStorage.getItem("cart") }
    $http.post('http://localhost/warehouse/order.php', JSON.stringify(data)).then(function(response){
        if(response.data.message == "order_created"){
          var myPopup = $ionicPopup.show({
            title: "Order Placed!",
            buttons: [
               { text: 'Continue Shopping',
                  onTap: function(e){
                    $state.go("home");
                  } 
              }, {
                  text: '<b>View Orders</b>',
                  type: 'button-positive',
                  onTap: function(e) {
                    $state.go("orders")
                  }
               }
            ]
         });
        }else{
          alert("Something went wrong, try again!");
        }
      })
  }

})

.controller('ProfileCtrl', function($scope,$http) {
  var username = localStorage.getItem("user");
  $http.get('http://localhost/warehouse/profile.php?username='+username).then(function(response){
        $scope.profile = response.data;
  })

})

.controller('OrdersCtrl', function($scope,$http) {
  var username = localStorage.getItem("user");
  $http.get('http://localhost/warehouse/user_orders.php?customer='+username).then(function(response){
        $scope.orders = response.data;
  })

});

