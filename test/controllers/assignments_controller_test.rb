require 'test_helper'

class AssignmentsControllerTest < ActionDispatch::IntegrationTest
	def setup
		@group = groups(:one)
	end

  test "should post assignment" do
  	assert_difference 'Assignment.count' do
  		post assignment_path, params: { subject: "abc",
																		content: "def",
																		due_date: "20/04/2017 13:00:00",
																		attachment: 101001010101,
																		group_id: @group.id }
  	end
		assert_response 201
  end

  test "should post assignment fail" do
  	assert_no_difference 'Assignment.count' do
  		post assignment_path, params: { subject: "abc",
																		content: "def",
																		due_date: "20/04/2017 13:00:00",
																		attachment: 101001010101 }
  	end
		assert_response 400
  end
end
