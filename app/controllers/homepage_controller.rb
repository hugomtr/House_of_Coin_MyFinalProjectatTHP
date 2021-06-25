class HomepageController < ApplicationController
  def index
    @estates_latest = latest_validated.max(4)
  end
end
