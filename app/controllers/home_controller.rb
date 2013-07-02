class HomeController < ApplicationController
  skip_before_filter :authenticate!

  def index
  end

  def about
  end

  def contact
  end
end
