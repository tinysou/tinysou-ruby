module Tinysou
  class Client
    # Methods for the Collections API
    module Collections
      def collections(engine, params = {})
        get "engines/#{engine}/collections", params
      end

      def create_collection(engine, attrs = {})
        post "engines/#{engine}/collections", attrs
      end

      def collection(engine, name)
        get "engines/#{engine}/collections/#{name}"
      end

      def update_collection(engine, name, attrs = {})
        put "engines/#{engine}/collections/#{name}", attrs
      end

      def destroy_collection(engine, name)
        delete "engines/#{engine}/collections/#{name}"
      end
    end
  end
end
