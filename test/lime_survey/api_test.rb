require "test_helper"

class LimeSurvey::ApiTest < Minitest::Test

  describe 'API methods' do


    it "throws an authentication error if bad credentials" do
      VCR.use_cassette("api authentication error on bad login", match_requests_on: [:query]) do
        bad_api = LimeSurvey::Api.new username: 'bad', password: 'test'
        assert_raises LimeSurvey::Api::AuthenticationError do
          bad_api.check_authentication
        end
      end
    end

  end

  # describe '#autocomplete' do
  #   it "Returns an autocomplete suggestion" do
  #     skip
  #     VCR.use_cassette('autocomplete returns', match_requests_on: [:query]) do
  #       response = LimeSurvey::Api.new.autocomplete('San Die', st: "CA")
  #       assert response
  #       assert_includes response["schoolMatches"].first["schoolName"], "San Diego"
  #     end
  #   end
  # end


end
