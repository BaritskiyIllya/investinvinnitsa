class ElasticController < ApplicationController
  def search
    @results = MultySearch.new.search(params['srch-term'])
  end
end
