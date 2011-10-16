class SlidesController < ApplicationController

  before_filter :find_all_slides
  before_filter :find_settings
  before_filter :find_page

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

protected

  def find_all_slides
    @slides = Slide.order('position ASC')
  end

  def find_settings
    s = RefinerySetting.find :first, :conditions => {:name => "slides"}
    @setting = slide_default_settings.merge(s ? s.value : {})
  end

  def find_page
    @page = Page.where(:link_url => "/slides").first
  end

  def slide_default_settings
    {
      :height        => 300,
      :width         => 900,
      :effect        => "stack",
      :duration      => 10,
      :delay         => 50,
      :autoplay      => true,
      :stop_on_hover => true,
      :loop          => true,
      :bullets       => true,
      :caption       => true,
      :controls      => true
    }
  end

end
