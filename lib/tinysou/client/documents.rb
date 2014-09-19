module Tinysou
  class Client
    # Methods for the Documents API
    module Documents
      def documents(engine, collection, params = {})
        get "engines/#{engine}/collections/#{collection}/documents", params
      end

      def create_document(engine, collection, attrs = {})
        post "engines/#{engine}/collections/#{collection}/documents", attrs
      end

      def document(engine, collection, id)
        get "engines/#{engine}/collections/#{collection}/documents/#{id}"
      end

      def update_document(engine, collection, id, attrs = {})
        put "engines/#{engine}/collections/#{collection}/documents/#{id}", attrs
      end

      def destroy_document(engine, collection, id)
        delete "engines/#{engine}/collections/#{collection}/documents/#{id}"
      end
    end
  end
end
