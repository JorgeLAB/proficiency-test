require 'rails_helper'

RSpec.feature "Create classrooms" do

  let!(:student) { create :student }
  let!(:course) { create :course }

  scenario "when the user create a classroom" do
    visit '/classrooms/new'
    expect(page).to have_content(I18n.t('page_content.actions.new', resource: I18n.t('activerecord.models.classroom.one') ) )
    select student[:name], from: "classroom[student_id]"
    select course[:name], from: "classroom[course_id]"
    click_button I18n.t('page_content.actions.new', resource: I18n.t('activerecord.models.classroom.one') )
    expect(page).to have_content(I18n.t('flash.actions.create.notice', resource_name: I18n.t('activerecord.models.classroom.one') ))
    expect(Classroom.count).to eq 1
  end

end
