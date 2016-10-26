class PagesController < ApplicationController
  def home
  end

  def about_us
    render template: "pages/about_us"
  end
end
