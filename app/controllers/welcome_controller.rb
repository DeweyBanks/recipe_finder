require 'will_paginate/array'
class WelcomeController < ApplicationController

  def index
  end

  def search
    terms = params["terms"]
    response = HTTParty.get("http://www.recipepuppy.com/api/",
    :query => { :i => terms })
    response = JSON.parse(response.body)["results"]
    @results = response.paginate(:page => params[:page], :per_page => 20)
    respond_to do |format|
       format.json { render :json => JSON.parse(@results) }
       format.html { render "index.html.erb" }
    end
  end
end
