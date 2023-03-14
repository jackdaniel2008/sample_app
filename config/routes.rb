Rails.application.routes.draw do
  get 'lists/new'
  get 'lists/edit'
  get '/top'=> 'homes#top'
  post 'lists' => 'lists#create'
  get 'lists' => 'lists#index'
  # 「:id」は.../lists/1 や .../lists/3 の数字部分に該当する
  # 「as:」オプションで「'list#show'」を「'list'」として利用できる
  # これを「名前付きルート」と呼ぶ
  get 'lists/:id' => 'lists#show', as: 'list'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
