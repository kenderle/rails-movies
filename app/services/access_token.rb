require 'digest/sha1'

class AccessToken

    def initialize(model)
        @model=model
    end

    def generate(input)
        