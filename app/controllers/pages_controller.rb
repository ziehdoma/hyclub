class PagesController < ApplicationController
  def home
  end

  def about
  end

  def gallery
    @picture = Picture.last
  end

  def blog
   
  end

  def contact
  end
end
