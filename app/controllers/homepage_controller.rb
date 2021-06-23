class HomepageController < ApplicationController
  def index
    @estates_latest = RealEstate.lastest_estate.max(4)
  end
end
