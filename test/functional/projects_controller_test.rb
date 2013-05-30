require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { book_size: @project.book_size, contribution_deadline: @project.contribution_deadline, event_date: @project.event_date, final_reminder: @project.final_reminder, invite_message_body: @project.invite_message_body, invite_message_subject: @project.invite_message_subject, name: @project.name, name: @project.name, occasion: @project.occasion, reminder_1: @project.reminder_1, reminder_2: @project.reminder_2, sharing_preference: @project.sharing_preference }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    put :update, id: @project, project: { book_size: @project.book_size, contribution_deadline: @project.contribution_deadline, event_date: @project.event_date, final_reminder: @project.final_reminder, invite_message_body: @project.invite_message_body, invite_message_subject: @project.invite_message_subject, name: @project.name, name: @project.name, occasion: @project.occasion, reminder_1: @project.reminder_1, reminder_2: @project.reminder_2, sharing_preference: @project.sharing_preference }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end
