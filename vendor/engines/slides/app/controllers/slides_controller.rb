class SlidesController < ApplicationController

  include SlidesHelper

  before_filter :find_all_slides
  before_filter :find_slides_settings
  before_filter :find_slides_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @slide in the line below:
    present(@page)
  end

  def show
    @slide = Slide.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @slide in the line below:
    present(@page)
  end
end
