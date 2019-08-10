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
      # LimeSurvey::Api.new.add_survey survey_id: 1234, survey_title: "Survey 1234", survey_language: "en", format: "A"
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

      def delete_participants(survey_id: , participants: [])
        authenticated_post "delete_participants", [survey_id, participants]
      end

      def delete_question(question_id: )
        authenticated_post "delete_question", [question_id]
      end

      def delete_survey(survey_id: )
        authenticated_post "delete_survey", [survey_id]
      end

      # document types:  pdf, csv, xls, doc, json-rpc
      def export_responses(survey_id: , document_type: 'json', language_code: 'en', completion_status: 'complete', heading_type: nil, response_type: nil, from_response_id: 0, to_response_id: 1_000_000, fields: nil)
        authenticated_post "export_responses", [survey_id, document_type, language_code, completion_status, heading_type, response_type, from_response_id, to_response_id, fields]
      end

      def export_responses_by_token(survey_id: , document_type: 'json', token: , language_code: 'en', completion_status: 'complete', heading_type: 'code', response_type: 'long', fields: nil)
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

      def get_response_ids(survey_id: , token:  )
        authenticated_post "get_response_ids", [survey_id, token]
      end

      def get_session_key
        response = post "get_session_key", [username, password]
      end

      def get_site_settings(setting_name: )
        authenticated_post "get_site_settings", [setting_name]
      end

      def get_summary(survey_id: , stat_name: nil)
        authenticated_post "get_summary", [survey_id, stat_name].compact
      end

      def get_survey_properties(survey_id: , survey_settings: nil)
        authenticated_post "get_survey_properties", [survey_id, survey_settings].compact
      end

      def get_uploaded_files(survey_id: , token:  )
        authenticated_post "get_uploaded_files", [survey_id, token]
      end

      def import_group(survey_id: , import_data: , import_data_type: , new_group_name: nil, new_group_description: nil)
        authenticated_post "import_group", [survey_id, import_data, import_data_type, new_group_name, new_group_description]
      end

      def import_question(survey_id: , group_id: , import_data: , import_data_type: , mandatory: 'no', new_question_title: nil, new_q_question: nil, new_question_help: nil)
        authenticated_post "import_question", [survey_id, group_id, import_data, import_data_type, mandatory, new_question_title, new_q_question, new_question_help]
      end

      def import_survey(import_data: , import_data_type: , new_survey_name: nil, destination_survey_id: nil)
        authenticated_post "import_survey", [import_data, import_data_type, new_survey_name, destination_survey_id]
      end
      # email: TRUE / FALSE
      def invite_participants(survey_id: , token_ids: [], email: )
        authenticated_post "invite_participants", [survey_id, token_ids, email]
      end

      def list_groups(survey_id: )
        authenticated_post "list_groups", [survey_id]
      end

      def list_participants(survey_id: , start: 0, limit: 10_000, unused: false, attributes: [], conditions: [])
        authenticated_post "list_participants", [survey_id, start, limit, unused, attributes, conditions]
      end

      def list_questions(survey_id: , group_id: nil, language: nil)
        authenticated_post "list_questions", [survey_id, group_id, language]
      end

      # LimeSurvey::Api.new.list_surveys
      def list_surveys(username: nil)
        authenticated_post "list_surveys", [username].compact
      end

      def list_users(user_id: nil)
        authenticated_post "list_users", [user_id].compact
      end

      def mail_registered_participants(survey_id: , override_all_conditions: [])
        authenticated_post "mail_registered_participants", [survey_id, override_all_conditions]
      end

      def release_session_key
        authenticated_post "release_session_key"
        @token = nil
      end

      def remind_participants(survey_id: , min_days_between: nil, max_reminders: nil, token_ids: nil)
        authenticated_post "remind_participants", [survey_id, min_days_between, max_reminders, token_ids]
      end

      def set_group_properties(group_id: , group_data: [])
        authenticated_post "set_group_properties", [group_id, group_data]
      end

      def set_language_properties(survey_id: , survey_locale_data: [], language: nil)
        authenticated_post "set_language_properties", [survey_id, survey_locale_data, language]
      end

      def set_participant_properties(survey_id: , token_query_properties: , token_data: )
        authenticated_post "set_participant_properties", [survey_id, token_query_properties, token_data]
      end

      def set_question_properties(question_id: , question_data: , language: )
        authenticated_post "set_question_properties", [question_id, question_data, language]
      end

      def set_quota_properties(quota_id: , quota_data: )
        authenticated_post "set_quota_properties", [quota_id, quota_data]
      end

      def set_survey_properties(survey_id: , survey_data: )
        authenticated_post "set_survey_properties", [survey_id, suvey_data]
      end

      def update_response(survey_id: , response_data: )
        authenticated_post "update_response", [survey_id, response_data]
      end

      #file_data is BASE64
      def upload_file(survey_id: , field_name: , file_name: , file_data: )
        authenticated_post "upload_file", params
      end


      def authenticated_post(method_name, params = [])
        check_authentication
        post method_name, params
      end

      def post(method_name, params = [])
        response = self.class.post(url_endpoint, body: modify_body(method_name, params), timeout: 60, headers: headers)
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

      def url_endpoint
        ENV.fetch("LIMESURVEY_API_URL", "not-implemented")
      end

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


