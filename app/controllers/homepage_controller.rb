class HomepageController < ApplicationController
  def index
    @estates_latest = RealEstate.latest_validated.max(4)
  end
end
