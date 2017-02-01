Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "product#index"
   get '/product/new' , to:'product#new'
   #ilk sayfa. değerleri girdiğim yer. 
   post '/product/new' , to:'product#create'
   #get ile aynı pathe sahip post action'ı olmazsa no route matches [post] hatası alırsın.
   #post ile alandaki değerleri alacak.
   get '/products' , to:'product#index', as: :products
   get '/product/:id', to: 'product#show', as: :product
   delete '/product/:id', to: 'product#delete'
   #delete methodu ile kaydı sileceğiz
   put '/product/:id' , to:'product#update'
end
