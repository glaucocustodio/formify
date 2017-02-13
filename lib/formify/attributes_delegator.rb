module Formify
  class AttributesDelegator
    def self.delegate(class_to_delegate, attributes, main_model_snaked)
      attributes.each do |attr|
        class_to_delegate.send(:delegate, attr, "#{attr}=", to: main_model_snaked)
      end
    end
  end
end
