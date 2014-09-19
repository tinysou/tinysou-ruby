module Tinysou
  class Client
    # Methods for the Search API
    module Search
      def search(engine, params = {})
        post "engines/#{engine}/search", params
      end

      def autocomplete(engine, params = {})
        post "engines/#{engine}/autocomplete", params
      end
    end
  end
end
