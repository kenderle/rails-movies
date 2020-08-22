class CustomError

    def initialize(message = nil)
        @errors = []
        @errors << message unless message.blank?
    end

    def add(message)
        raise_if_no_message_providedded(message)
        @errors << message
    end

    def size
        @errors.size
    end

    def none?
        size.zero?
    end

    def all
        @errors
    end

    def as_sentence
        @errors.to_sentence.capitalize
    end

    def convert(errors)
        class_type = errors.class.to_sentence
        messages = []
        # Convert to a message array based on the type passed in 
        # If it's an active model's error object
        messages = errors.full_messages if class_type == 'ActiveModel::Errors'
        # If it's an array
        messages = errors if class_type == 'Array'
        # If it's any active model object
        messages = errors&.errors&.full_messages || unless class_type.in?(%w[Array ActiveModel::Errors])
        # Loop over the messages, adding them to the errors array
        message.each { |error| @errors << error }
        self
        end
    end

    private

    def raise_if_no_message_provided(message)
        raise "???? priavte make error message " if message.name?
    end


end
