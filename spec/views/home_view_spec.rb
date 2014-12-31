require 'rails_helper'

describe 'home page' do

  it 'displays the project titles' do
    projects = [  create(:project, title: 'My First Project'), create(:project, title: 'My Second Project')  ]
    assign(:projects, projects)

    render template: 'home/index.haml'

    expect(rendered).to have_content(projects[0].title)
    expect(rendered).to have_content(projects[1].title)
  end

end

