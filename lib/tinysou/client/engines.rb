module Tinysou
  class Client
    # Methods for the Engines API
    module Engines
      def engines(params = {})
        get 'engines', params
      end

      def create_engine(attrs = {})
        post 'engines', attrs
      end

      def engine(name)
        get "engines/#{name}"
      end

      def update_engine(name, attrs = {})
        put "engines/#{name}", attrs
      end

      def destroy_engine(name)
        delete "engines/#{name}"
      end
    end
  end
end
