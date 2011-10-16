module SlidesHelper

  def render_slides
    find_slides_settings
    find_all_slides
    render :partial => "/shared/slides"
  end

  protected

  def find_all_slides
    @slides = Slide.order('position ASC')
  end

  def find_slides_settings
    s = RefinerySetting.find :first, :conditions => {:name => "slides"}
    @setting = slide_default_settings.merge(s ? s.value : {})
  end

  def find_slides_page
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
