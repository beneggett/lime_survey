
# require "active_support/all"
require "httparty"
require "ostruct"

require "lime_survey/api"
require "lime_survey/version"


module LimeSurvey
  class Api::AuthenticationError < StandardError
    def initialize(msg="Could not Authenticate")
      super
    end
  end
end
