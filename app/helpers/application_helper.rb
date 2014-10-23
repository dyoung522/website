module ApplicationHelper
  def app_name
    'Donovan Young'
  end

  def title
    if controller_name == 'home'
      app_name
    else
      "#{app_name} | #{content_for(:title) || controller_name.humanize}"
    end
  end
end
