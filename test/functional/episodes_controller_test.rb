require 'test_helper'

class EpisodesControllerTest < ActionController::TestCase
  setup do
    @episode = episodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:episodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create episode" do
    assert_difference('Episode.count') do
      post :create, :episode => { :art_location => @episode.art_location, :date => @episode.date, :description => @episode.description, :duration => @episode.duration, :file_location => @episode.file_location, :file_size => @episode.file_size, :keywords => @episode.keywords, :number => @episode.number, :podcast_id => @episode.podcast_id, :show_notes => @episode.show_notes, :title => @episode.title }
    end

    assert_redirected_to episode_path(assigns(:episode))
  end

  test "should show episode" do
    get :show, :id => @episode
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @episode
    assert_response :success
  end

  test "should update episode" do
    put :update, :id => @episode, :episode => { :art_location => @episode.art_location, :date => @episode.date, :description => @episode.description, :duration => @episode.duration, :file_location => @episode.file_location, :file_size => @episode.file_size, :keywords => @episode.keywords, :number => @episode.number, :podcast_id => @episode.podcast_id, :show_notes => @episode.show_notes, :title => @episode.title }
    assert_redirected_to episode_path(assigns(:episode))
  end

  test "should destroy episode" do
    assert_difference('Episode.count', -1) do
      delete :destroy, :id => @episode
    end

    assert_redirected_to episodes_path
  end
end
