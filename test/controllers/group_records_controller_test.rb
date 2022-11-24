require 'test_helper'

class GroupRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_record = group_records(:one)
  end

  test 'should get index' do
    get group_records_url
    assert_response :success
  end

  test 'should get new' do
    get new_group_record_url
    assert_response :success
  end

  test 'should create group_record' do
    assert_difference('GroupRecord.count') do
      post group_records_url,
           params: { group_record: { group_id: @group_record.group_id, record_id: @group_record.record_id } }
    end

    assert_redirected_to group_record_url(GroupRecord.last)
  end

  test 'should show group_record' do
    get group_record_url(@group_record)
    assert_response :success
  end

  test 'should get edit' do
    get edit_group_record_url(@group_record)
    assert_response :success
  end

  test 'should update group_record' do
    patch group_record_url(@group_record),
          params: { group_record: { group_id: @group_record.group_id, record_id: @group_record.record_id } }
    assert_redirected_to group_record_url(@group_record)
  end

  test 'should destroy group_record' do
    assert_difference('GroupRecord.count', -1) do
      delete group_record_url(@group_record)
    end

    assert_redirected_to group_records_url
  end
end
