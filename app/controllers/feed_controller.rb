class FeedController < ApplicationController
  def index
    @xml = ProductsFeed.new.generate
  end
end
