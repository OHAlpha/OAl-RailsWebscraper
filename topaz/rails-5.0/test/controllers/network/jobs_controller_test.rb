require 'test_helper'

class Network::JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @network_job = network_jobs(:one)
  end

  test "should get index" do
    get network_jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_network_job_url
    assert_response :success
  end

  test "should create network_job" do
    assert_difference('Network::Job.count') do
      post network_jobs_url, params: { network_job: { access_id: @network_job.access_id, downloaded: @network_job.downloaded, long_message: @network_job.long_message, message: @network_job.message, priority: @network_job.priority, size: @network_job.size, status: @network_job.status } }
    end

    assert_redirected_to network_job_url(Network::Job.last)
  end

  test "should show network_job" do
    get network_job_url(@network_job)
    assert_response :success
  end

  test "should get edit" do
    get edit_network_job_url(@network_job)
    assert_response :success
  end

  test "should update network_job" do
    patch network_job_url(@network_job), params: { network_job: { access_id: @network_job.access_id, downloaded: @network_job.downloaded, long_message: @network_job.long_message, message: @network_job.message, priority: @network_job.priority, size: @network_job.size, status: @network_job.status } }
    assert_redirected_to network_job_url(@network_job)
  end

  test "should destroy network_job" do
    assert_difference('Network::Job.count', -1) do
      delete network_job_url(@network_job)
    end

    assert_redirected_to network_jobs_url
  end
end
