require 'active_model'
require 'formify/columns'
require 'formify/attributes_delegator'
require 'formify/params'
require 'formify/save'

module Formify
  module ConfigurationMethods
    extend ActiveSupport::Concern

    class_methods do
      def main_model(main_model)
        @main_model = main_model.to_s.camelize

        AttributesDelegator.delegate(
          self,
          Columns.names_for(self.get_main_model),
          main_model_snaked
        )
      end

      def get_main_model
        @main_model ||= self.name.split("Form").first
      end

      def main_model_snaked
        get_main_model.underscore
      end
    end

    def main_model_snaked
      self.class.main_model_snaked
    end

    included do
      if Object.const_defined?("ActiveModel::Model")
        include ActiveModel::Model
      else
        include ActiveModel::Validations
      end

      include Params
      include Save
    end
  end
end
