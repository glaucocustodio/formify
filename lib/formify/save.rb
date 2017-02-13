module Formify
  module Save
    def save(validate: true)
      ActiveRecord::Base.transaction do
        valid = true

        if validate
          valid = valid?
          save_around_callbacks if valid
        else
          save_around_callbacks
        end

        valid && @saved_successfully
      end
    end

    def before_save; end

    def after_save; end

    private

    def save_around_callbacks
      before_save
      @saved_successfully = model_instance.save
      after_save
    end

    def model_instance
      send(main_model_snaked)
    end
  end
end
