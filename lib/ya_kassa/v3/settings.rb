module YaKassa
  module V3
    class Settings
      class << self
        def shop_id
          @@shop_id || nil
        end

        def secret_key
          @@secret_key || nil
        end

        def shop_id=(val)
          @@shop_id = val
        end

        def secret_key=(val)
          @@secret_key = val
        end
      end
    end
  end
end
