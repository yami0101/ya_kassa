module YaKassa
  module V3
    module Concerns
      module Attributable
        def attributable(name, params = {})
          define_attr_method(name, params[:default])
        end

        private

        def define_attr_method(name, default_val = nil)
          define_method(name) do
            if @params[name.to_sym].nil?
              @params[name.to_sym] = default_val
            end
            @params[name.to_sym]
          end

          define_method("#{name}=") do |val|
            @params[name.to_sym] = val
          end
        end
      end
    end
  end
end
