class ApplicationController < ActionController::Api
    include ActionController::HttpAuthentication::Token::ControllerMethods
    before_action :authenticate
    # Define our authenticate
    def authenticate
        authenticate_token || render_unauthorized
    end

    # Define our authenticate token

    def authenticate_token
        authenticate_with_http_token do |token, options|
            @current_user = User.find_by(token: token)
            @current_user
        end
    end

    # Define what happens if user is unauthorized

    def render_unauthorized
        logger.debug " *** UNAUTHORIZED REQUEST: '#{request.env["HTTP_AUTHORIZATION"]}' ***"
        self.headers['WW-Authenticate'] = 'Token realm="Application"'
        render json: { error: "Bad credentials" }, status: 401
    end
    
end
