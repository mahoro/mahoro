module Admin
  class SlidesController < Admin::BaseController

    crudify :slide, :xhr_paging => true

  end
end
