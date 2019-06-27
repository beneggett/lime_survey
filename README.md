[![Gem Version](https://badge.fury.io/rb/lime_survey.svg)](https://badge.fury.io/rb/lime_survey)
[![Build Status](https://travis-ci.com/beneggett/lime_survey.svg?branch=master)](https://travis-ci.com/beneggett/lime_survey)
[![Coverage Status](https://coveralls.io/repos/github/beneggett/lime_survey/badge.svg?branch=master)](https://coveralls.io/github/beneggett/lime_survey?branch=master)
# LimeSurvey

Fully Implements the LimeSurvey API in Ruby


## Installation

Add this line to your application's Gemfile:
```ruby
gem 'lime_survey'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lime_survey

Be sure to define your LimeSurvey credentials by setting up environment variables in your application appropriately. Refer to the .env.sample file for details.
```
LIMESURVEY_API_URL = "https://YOUR_URL/survey/index.php?r=admin/remotecontrol"
LIMESURVEY_USERNAME = "my-user"
LIMESURVEY_PASSWORD = "my-password"
```

If you simply would like to play with the API, you can use the public demo credentials which are:

```
LIMESURVEY_API_URL:  "https://demo.limesurvey.org/index.php?r=admin/remotecontrol"
LIMESURVEY_USERNAME: "demo"
LIMESURVEY_PASSWORD: "demo"

```
Public credentials last updated 4/25/2019

## Usage

There are 48 primary APIs that are wrapped. Below you will see basic examples of how to use them. For more information about what optional query parameters are available, please consult the [LimeSurvey API Docs](https://api.limesurvey.org/classes/remotecontrol_handle.html#method_list_surveys)

Authenticated calls require a token, this library already handles the request & reload of tokens as needed via the `check_authentication` & `get_session_key methods` defined in LimeSurvey::Api

#### Activate Survey

```
LimeSurvey::Api.new.activate_survey survey_id: 1
```

#### Activate Tokens

```
LimeSurvey::Api.new.activate_tokens survey_id: 1, attribute_fields: [3,5,7]
```

#### Add Group

```
LimeSurvey::Api.new.add_group
```

#### Add Language

```
LimeSurvey::Api.new.add_language
```

#### Add Participants

```
LimeSurvey::Api.new.add_participants
```

#### Add Response

```
LimeSurvey::Api.new.add_response
```

#### Add Survey

```
LimeSurvey::Api.new.add_survey
```

#### Copy Survey

```
LimeSurvey::Api.new.copy_survey
```

#### Cpd Import Participants

```
LimeSurvey::Api.new.cpd_import_participants
```

#### Delete Group

```
LimeSurvey::Api.new.delete_group
```

#### Delete Language

```
LimeSurvey::Api.new.delete_language
```

#### Delete Participants

```
LimeSurvey::Api.new.delete_participants
```

#### Delete Question

```
LimeSurvey::Api.new.delete_question
```

#### Delete Survey

```
LimeSurvey::Api.new.delete_survey
```

#### Export Responses

```
LimeSurvey::Api.new.export_responses
```

#### Export Responses By Token

```
LimeSurvey::Api.new.export_responses_by_token
```

#### Export Statistics

```
LimeSurvey::Api.new.export_statistics
```

#### Export Timeline

```
LimeSurvey::Api.new.export_timeline
```

#### Get Group Properties

```
LimeSurvey::Api.new.get_group_properties
```

#### Get Language Properties

```
LimeSurvey::Api.new.get_language_properties
```

#### Get Participant Properties

```
LimeSurvey::Api.new.get_participant_properties
```

#### Get Question Properties

```
LimeSurvey::Api.new.get_question_properties
```

#### Get Response Ids

```
LimeSurvey::Api.new.get_response_ids
```

#### Get Session Key

```
LimeSurvey::Api.new.get_session_key
```

#### Get Site Settings

```
LimeSurvey::Api.new.get_site_settings
```

#### Get Summary

```
LimeSurvey::Api.new.get_summary
```

#### Get Survey Properties

```
LimeSurvey::Api.new.get_survey_properties
```

#### Get Uploaded Files

```
LimeSurvey::Api.new.get_uploaded_files
```

#### Import Group

```
LimeSurvey::Api.new.import_group
```

#### Import Question

```
LimeSurvey::Api.new.import_question
```

#### Import Survey

```
LimeSurvey::Api.new.import_survey
```

#### Invite Participants

```
LimeSurvey::Api.new.invite_participants
```

#### List Groups

```
LimeSurvey::Api.new.list_groups
```

#### List Participants

```
LimeSurvey::Api.new.list_participants
```

#### List Questions

```
LimeSurvey::Api.new.list_questions
```

#### List Surveys

```
LimeSurvey::Api.new.list_surveys
```

#### List Users

```
LimeSurvey::Api.new.list_users
```

#### Mail Registered Participants

```
LimeSurvey::Api.new.mail_registered_participants
```

#### Release Session Key

```
LimeSurvey::Api.new.release_session_key
```

#### Remind Participants

```
LimeSurvey::Api.new.remind_participants
```

#### Set Group Properties

```
LimeSurvey::Api.new.set_group_properties
```

#### Set Language Properties

```
LimeSurvey::Api.new.set_language_properties
```

#### Set Participant Properties

```
LimeSurvey::Api.new.set_participant_properties
```

#### Set Question Properties

```
LimeSurvey::Api.new.set_question_properties
```

#### Set Quota Properties

```
LimeSurvey::Api.new.set_quota_properties
```

#### Set Survey Properties

```
LimeSurvey::Api.new.set_survey_properties
```

#### Update Response

```
LimeSurvey::Api.new.update_response
```

#### Upload File

```
LimeSurvey::Api.new.upload_file
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/beneggett/lime_survey. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the LimeSurvey project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/beneggett/lime_survey/blob/master/CODE_OF_CONDUCT.md).


