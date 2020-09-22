class SurgeriesController < ApplicationController


  def index
    @surgeries = Surgery.all
  end

  def show
    @surgeries = Surgery.all
    @surgery = Surgery.find(params[:id])
  end
end
