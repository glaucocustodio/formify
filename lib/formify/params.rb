module Formify
  module Params
    def params=(params)
      before_set_params(params)

      params.each do |param, value|
        send("#{param}=", value)
      end
    end

    def before_set_params(params); end
  end
end
