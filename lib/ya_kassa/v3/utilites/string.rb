module YaKassa
  module V3
    module Utilites
      class String
        # copied from activesupport/lib/active_support/inflector
        def self.constantize(camel_cased_word)
          unless /\A(?:::)?([A-Z]\w*(?:::[A-Z]\w*)*)\z/ =~ camel_cased_word
            raise NameError, "#{camel_cased_word.inspect} is not a valid constant name!"
          end
          Object.module_eval("::#{$1}", __FILE__, __LINE__)
        end
      end
    end
  end
end
