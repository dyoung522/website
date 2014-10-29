class HomeController < ApplicationController
  def index
    @projects = Project.all
    @home = Tag.where(name: 'home').first
  end
end
