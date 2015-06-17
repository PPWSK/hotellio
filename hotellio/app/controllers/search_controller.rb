class SearchController < ApplicationController

  def new
    @search_query = SearchQuery.new.with_some_defaults
  end

end
