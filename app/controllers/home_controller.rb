
require 'net/http'

class HomeController < ApplicationController
    def index
        @entries = []
        @rider_names = []

    end

    def search #Search The API
        search_query = params[:search_query]
        @entries = Entries.search(search_query)
 
    end

    def filter
        search_query = params[:search_query]
        @entries = Entries.search(search_query)
        @filteredByRider = @entries.filteredByRider(:selectedRider)

    end
end

