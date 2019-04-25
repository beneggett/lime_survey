module LimeSurvey
  class Api
      URL_ENDPOINT = ENV.fetch("LIMESURVEY_API_URL", "not-implemented")

      include HTTParty

      attr_accessor :username, :password, :token

      def initialize(options = {})
        @username = options.fetch(:username, default_username)
        @password = options.fetch(:password, default_password)
        @token = options.dig(:token)
      end

      # LimeSurvey::Api.new.activate_survey survey_id: 1
      def activate_survey(survey_id:)
        authenticated_post "activate_survey", [survey_id].compact
      end

      # LimeSurvey::Api.new.activate_tokens survey_id: 1, attribute_fields: [3,5,7]
      def activate_tokens(survey_id:, attribute_fields: [])
        authenticated_post "activate_tokens", [survey_id, attribute_fields]
      end

      # LimeSurvey::Api.new.add_group 
      def add_group(survey_id:, group_title: , group_description: '' )
        authenticated_post "add_group", [survey_id, group_title, group_description]
      end

      def add_language(survey_id: , language: )
        authenticated_post "add_language", [survey_id, language]
      end

      def add_participants(survey_id: , participant_data: [], create_token: true)
        authenticated_post "add_participants", [survey_id, participant_data, create_token]
      end

      def add_response(survey_id: , response_data: [])
        authenticated_post "add_response", [survey_id, response_data]
      end
      # Format can be A|G|S
      def add_survey(survey_id: , survey_title: , survey_language: , format: 'G' )
        authenticated_post "add_survey", [survey_id, survey_title, survey_language, format]
      end

      def copy_survey(survey_id: , survey_name: )
        authenticated_post "copy_survey", [survey_id, survey_name]
      end

      def cpd_import_participants(participants: [])
        authenticated_post "cpd_importParticipants", [participants]
      end

      def delete_group(survey_id: , group_id: )
        authenticated_post "delete_group", [survey_id, group_id]
      end

      def delete_language(survey_id: , language: )
        authenticated_post "delete_language", [survey_id, language]
      end

      def delete_participants(survey_id: , particpants: [])
        authenticated_post "delete_participants", [survey_id, particpants]
      end

      def delete_question(question_id: )
        authenticated_post "delete_question", [question_id]
      end

      def delete_survey(survey_id: )
        authenticated_post "delete_survey", [survey_id]
      end

      # document types:  pdf, csv, xls, doc, json-rpc
      def export_responses(survey_id: , document_type: , language_code: nil, completion_status: nil, heading_type: nil, response_type: nil, from_response_id: nil, to_response_id: nil, fields: nil)
        authenticated_post "export_responses", [survey_id, document_type, language_code, completion_status, heading_type, response_type, from_response_id, to_response_id, fields]
      end

      def export_responses_by_token(survey_id: , document_type: , token: , language_code: , completion_status: 'all', heading_type: 'code', response_type: 'short', fields: nil)
        authenticated_post "export_responses_by_token", [survey_id, document_type, token, language_code, completion_status, heading_type, response_type, fields]
      end

      def export_statistics(survey_id: , document_type: , token: , language_code: , graph: 'no', group_ids: nil)
        authenticated_post "export_statistics", [survey_id, document_type, token, language_code, graph, group_ids]
      end

      def export_timeline(survey_id: , survey_type: 'day', start_time: , end_time: ) 
        authenticated_post "export_timeline", [survey_id, survey_type, start_time, end_time]
      end

      def get_group_properties(group_id: , group_settings: [])
        authenticated_post "get_group_properties", [group_id, group_settings]
      end

      def get_language_properties(survey_id: , survey_locale_settings: nil, language: nil)
        authenticated_post "get_language_properties", [survey_id, survey_locale_settings, language]
      end

      def get_participant_properties(survey_id: , token_query_properties: nil, token_properties: nil)
        authenticated_post "get_participant_properties", [survey_id, token_query_properties, token_properties]
      end

      def get_question_properties(question_id: , question_settings: [], language: nil)
        authenticated_post "get_question_properties", [question_id, question_settings, language]
      end

      def get_response_ids(survey_id: )
        authenticated_post "get_response_ids", params
      end

      def get_session_key
        response = post "get_session_key", [username, password]
      end

      def get_site_settings(survey_id: )
        authenticated_post "get_site_settings", params
      end

      def get_summary(survey_id: )
        authenticated_post "get_summary", params
      end

      def get_survey_properties(survey_id: )
        authenticated_post "get_survey_properties", params
      end

      def get_uploaded_files(survey_id: )
        authenticated_post "get_uploaded_files", params
      end

      def import_group(survey_id: )
        authenticated_post "import_group", params
      end

      def import_question(survey_id: )
        authenticated_post "import_question", params
      end

      def import_survey(survey_id: )
        authenticated_post "import_survey", params
      end

      def invite_participants(survey_id: )
        authenticated_post "invite_participants", params
      end

      def list_groups(survey_id: )
        authenticated_post "list_groups", params
      end

      def list_participants(survey_id: )
        authenticated_post "list_participants", params
      end

      def list_questions(survey_id: )
        authenticated_post "list_questions", params
      end

      def list_surveys(survey_id: nil)
        authenticated_post "list_surveys", []
      end

      def list_users(survey_id: )
        authenticated_post "list_users", params
      end

      def mail_registered_participants(survey_id: )
        authenticated_post "mail_registered_participants", params
      end

      def release_session_key
        authenticated_post "release_session_key"
        @token = nil
      end

      def remind_participants(survey_id: )
        authenticated_post "remind_participants", params
      end

      def set_group_properties(survey_id: )
        authenticated_post "set_group_properties", params
      end

      def set_language_properties(survey_id: )
        authenticated_post "set_language_properties", params
      end

      def set_participant_properties(survey_id: )
        authenticated_post "set_participant_properties", params
      end

      def set_question_properties(survey_id: )
        authenticated_post "set_question_properties", params
      end

      def set_quota_properties(survey_id: )
        authenticated_post "set_quota_properties", params
      end

      def set_survey_properties(survey_id: )
        authenticated_post "set_survey_properties", params
      end

      def update_response(survey_id: )
        authenticated_post "update_response", params
      end

      def upload_file(survey_id: )
        authenticated_post "upload_file", params
      end


      def authenticated_post(method_name, params = [])
        check_authentication
        post method_name, params
      end

      def post(method_name, params = [])
        response = self.class.post(URL_ENDPOINT, body: modify_body(method_name, params), timeout: 60, headers: headers)        
        OpenStruct.new body: JSON::parse(response.body), request: response.request, code: response.code
      end

      def check_authentication
        if token
          return self
        else
          authenticate!
        end
      end

      private


      def authenticate!
        response = get_session_key
        raise AuthenticationError.new(response.body.dig("result", "status")) if response.body.dig("result").is_a?(Hash) && response.body.dig("result", "status") == "Invalid user name or password"
        @token = response.body.dig("result")
        response
      end

      def argument_cleaner(required_params: , optional_params: , options: )
        missing_required = required_params - options.map {|k,v| k.to_sym }
        raise ArgumentError.new("Missing Required Arguments: #{missing_required.join(', ')}") if missing_required.any?
        all_params = (required_params + optional_params).flatten
        return options.select {|k,v| all_params.include?(k.to_sym)}
      end

      def modify_body(method_name, params = [])
        
        default_params = {
          method: method_name,
          params: params,
          id: 'json-rpc'
        }

        default_params[:params] = [token] + params if token
        default_params.to_json
      end


      def headers
        @headers = {
          "Accept" => "application/json",
          "Content-Type" => "application/json",
          "Connection" => "Keep-Alive",
        }
      end

      def default_username
        ENV["LIMESURVEY_USERNAME"]
      end

      def default_password
        ENV["LIMESURVEY_PASSWORD"]
      end

      def default_base_url
        ENV["LIMESURVEY_BASE_URL"]
      end

  end
end

# api_method = 'get_session_key'


