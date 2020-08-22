Rails.application.routes.draw do
  namespace :api, default: { format: :json }
    namespace :v1 do
      namespace :users do
        post :login
        post :create
        delete :destroy
        get :me
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
