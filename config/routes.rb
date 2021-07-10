Rails.application.routes.draw do
  get 'auth/api/v1'
  namespace :api do
    namespace :v1 do
      scope :auth do
          post :register, to: 'auth#register'
          post :login, to: 'auth#login'
      end
      scope :reports do
        scope :licenses do
          post :submit, to: 'licenses#submit'
        end
      end
    end
  end
end
