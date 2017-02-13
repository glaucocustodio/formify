module Formify
  class Columns
    def self.names_for(model)
      model.constantize.columns.map(&:name)
    end
  end
end
