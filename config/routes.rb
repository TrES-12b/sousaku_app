Rails.application.routes.draw do
  get "profiles/show"
  get "profiles/edit"
  get "profiles/update"
  get "profile/show"
  # ホーム画面をトップに設定
  root "home#index"

  # キャラクターと世界観のリソース
  resources :characters
  resources :worlds, only: [:index, :show] do
    # 各世界観に属するキャラ一覧（ネストでルーティング対応）
    resources :characters, only: [:index]
  end
  resource :profile, only: [:show, :edit, :update]
end
