module Fastlane
  module Actions
    module SharedValues
      APPFILE_APP_IDENTIFIER = :APPFILE_APP_IDENTIFIER
      APPFILE_APPLE_ID = :APPFILE_APPLE_ID
      APPFILE_TEAM_NAME = :APPFILE_TEAM_NAME
      APPFILE_ITC_TEAM_NAME = :APPFILE_ITC_TEAM_NAME
    end

    class AppfileFetchAction < Action
      def self.run(params)
        if params[:fetch_app_identifier] == true
          Actions.lane_context[SharedValues::APPFILE_APP_IDENTIFIER] = CredentialsManager::AppfileConfig.try_fetch_value(:app_identifier)
        end
        if params[:fetch_apple_id] == true
          Actions.lane_context[SharedValues::APPFILE_APPLE_ID] = CredentialsManager::AppfileConfig.try_fetch_value(:apple_id)
        end
        if params[:fetch_team_name] == true
          Actions.lane_context[SharedValues::APPFILE_TEAM_NAME] = CredentialsManager::AppfileConfig.try_fetch_value(:team_name)
        end
        if params[:fetch_itc_team_name] == true
          Actions.lane_context[SharedValues::APPFILE_ITC_TEAM_NAME] = CredentialsManager::AppfileConfig.try_fetch_value(:itc_team_name)
        end
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Fetch Appfile info"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :fetch_app_identifier,
                                       description: "Fetch the app identifier",
                                       is_string: false,
                                       default_value: true),
          FastlaneCore::ConfigItem.new(key: :fetch_itc_team_name,
                                       description: "Fetch the iTunes connect team name",
                                       is_string: false,
                                       default_value: true),
          FastlaneCore::ConfigItem.new(key: :fetch_team_name,
                                       description: "Fetch the dev portal team name",
                                       is_string: false,
                                       default_value: true),
          FastlaneCore::ConfigItem.new(key: :fetch_apple_id,
                                       description: "Fetch the apple ID",
                                       is_string: false,
                                       default_value: true)
        ]
      end

      def self.output
        [
          ['APPFILE_APP_IDENTIFIER', 'The app identifier'],
          ['APPFILE_APPLE_ID', 'The apple ID'],
          ['APPFILE_TEAM_NAME', 'The dev portal team name'],
          ['APPFILE_ITC_TEAM_NAME', 'The iTunes connect team name'],
        ]
      end
      def self.authors
        ["bbriatte"]
      end

      def self.is_supported?(platform)
        [:ios, :mac].include?(platform)
      end
    end
  end
end
