class SondagesController < ApplicationController
  def index
    @sondages = Sondage.all
  end
end
