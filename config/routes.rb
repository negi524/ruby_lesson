Rails.application.routes.draw do
  root "articles#index"

  resources :articles, only: [:show, :create] do
    # articlesの内側にネストしたリソースとしてcommentsを作成
    # 記事とコメントの関係性を階層的に捉える
    resources :comments
  end
end
