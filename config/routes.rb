Rails.application.routes.draw do
  namespace :api do
    scope :module => 'users' do
      controller :kakao do
        post '/share/callback_kakao' => :callback_kakao
      end
    end
  end
  get 'kakao/callback'

  get 'kakao/index'
  get 'kakao/t'
  root 'kakao#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
