module Fastlane
  module Actions
    module SharedValues
      PROJECT_NAME = :PROJECT_NAME
      XCODEPROJ_PATH = :XCODEPROJ_PATH
      PLIST_PATH = :PLIST_PATH
    end

    class GetProjectInfoAction < Action
      def self.run(params)
        project_path = params[:xcodeproj]
        if project_path == nil
          if projects = Dir["*.xcodeproj"]
            project_path = projects.first
          end
        end
        if project_path != nil
          Actions::lane_context[SharedValues::XCODEPROJ_PATH] = project_path
          project_name = File.basename(project_path, ".xcodeproj")
          Actions::lane_context[SharedValues::PROJECT_NAME] = project_name
          plist_path = self.get_plist_path(project_name)
          Actions::lane_context[SharedValues::PLIST_PATH] = plist_path
          return {
            xcodeproj: project_path,
            name: project_name,
            plist_path: plist_path
          }
        else
          UI.user_error! "Cannot retrieve xcodeproj"
        end
      end

      def self.get_plist_path(project_name)
        plist_name = "Info.plist"
        plist_paths = [project_name, "Sources", "."]
        i = 0
        while i < plist_paths.length do
          plist_path = File.join(plist_paths[0], plist_name)
          if File.exists?(plist_path)
            return plist_path
          end
          i += 1
        end
        return nil
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Retrieves the project name"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :xcodeproj,
                                       env_name: "XCODEPROJ_PATH",
                                       description: "The xcodeoproj path",
                                       optional: true)
        ]
      end

      def self.output
        [
          ['PROJECT_NAME', 'The project name'],
          ['XCODEPROJ_PATH', 'The xcodeproj path'],
          ['PLIST_PATH', 'The plist path']
        ]
      end

      def self.return_value
        "An hash containing information about the project such as the name, the plist path and the xcodeproj path"
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
