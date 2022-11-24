require 'application_system_test_case'

class GroupRecordsTest < ApplicationSystemTestCase
  setup do
    @group_record = group_records(:one)
  end

  test 'visiting the index' do
    visit group_records_url
    assert_selector 'h1', text: 'Group records'
  end

  test 'should create group record' do
    visit group_records_url
    click_on 'New group record'

    fill_in 'Group', with: @group_record.group_id
    fill_in 'Record', with: @group_record.record_id
    click_on 'Create Group record'

    assert_text 'Group record was successfully created'
    click_on 'Back'
  end

  test 'should update Group record' do
    visit group_record_url(@group_record)
    click_on 'Edit this group record', match: :first

    fill_in 'Group', with: @group_record.group_id
    fill_in 'Record', with: @group_record.record_id
    click_on 'Update Group record'

    assert_text 'Group record was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Group record' do
    visit group_record_url(@group_record)
    click_on 'Destroy this group record', match: :first

    assert_text 'Group record was successfully destroyed'
  end
end
