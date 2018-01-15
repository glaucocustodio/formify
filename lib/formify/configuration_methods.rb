require 'active_model'
require 'formify/columns'
require 'formify/attributes_delegator'
require 'formify/params'
require 'formify/save'

module Formify
  module ConfigurationMethods
    extend ActiveSupport::Concern

    module ClassMethods
      def main_model(main_model)
        @main_model = main_model.to_s.camelize
      end

      def get_main_model
        @main_model ||= self.name.split("Form").first.singularize
      end

      def main_model_snaked
        get_main_model.underscore
      end

      def delegate_attributes
        AttributesDelegator.delegate(
          self,
          Columns.names_for(get_main_model),
          main_model_snaked
        )
      end
    end

    def main_model_snaked
      self.class.main_model_snaked
    end

    included do
      delegate_attributes

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
