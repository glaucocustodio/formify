require "formify/version"
require 'active_support/all'
require 'formify/configuration_methods'

module Formify
  extend ActiveSupport::Concern
  include ConfigurationMethods

  def initialize(main_model_instance = self.class.get_main_model.constantize.new)
    instance_variable_set("@#{main_model_snaked}", main_model_instance)
    self.class.__send__(:attr_reader, main_model_snaked)
  end

  included do
    # allow to use form instance variable in form_for. Ie: form_for(@user_form)
    def to_model
      instance_variable_get("@#{self.class.main_model_snaked}")
    end
  end
end
