require 'rails_helper'

describe 'User can CRUD courses' do

  before :each do
    visit root_path
    @user = User.create(user_name: "test1", password: "1234")
    click_link 'Login'
    fill_in "User name", with: "test1"
    fill_in "Password", with: "1234"
    click_button 'Login'
    click_link 'Courses'
  end

  it 'User can see courses index' do
    expect(page).to have_content 'Courses'
  end

  it 'User can create courses' do
    click_link 'Add new course'
    expect(page).to have_content 'Add a new course'
    fill_in "Title", with: "Test course title"
    check("Day")
    click_button 'Create Course'
    expect(page).to have_content "Course Information:"
  end
  it 'User can edit courses' do
    @course = Course.create(title: "testing", day: true)
    visit("/courses/#{@course.id}/edit")
    fill_in "Title", with: "Test course title"
    uncheck("Day")
    click_button 'Update Course'
    expect(page).to have_content "Test course title"
  end

  it 'User can see course show page' do
    click_link 'Add new course'
    expect(page).to have_content 'Add a new course'
    fill_in "Title", with: "Test course title"
    check("Day")
    click_button 'Create Course'
    expect(page).to have_content "Test course title"
  end

  it 'User can delete course' do
    @course = Course.create(title: "testing", day: true)
    visit("/courses/#{@course.id}")
    click_link 'Delete'
    expect(page).to have_content "Course sucessfully deleted"
  end



end
