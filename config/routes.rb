Rails.application.routes.draw do
  get 'kakao/callback'

  get 'kakao/index'
  root 'kakao#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end