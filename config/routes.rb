Rails.application.routes.draw do
  resources :reviews
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :users do
        post :login
        post :create
        get :me
        delete :logout
      end
      namespace :movies do
        get :index
        get :show
        post :create
        patch :update
        delete :destroy
        get :get_upload_credentials
      end
      namespace :reviews do
        get :index
        get :show
        post :create
        patch :update
        delete :destroy
      end
    end
  end
end