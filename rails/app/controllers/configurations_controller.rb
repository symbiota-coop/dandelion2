class ConfigurationsController < ApplicationController
  def ios_v1
    render json: {
      settings: {},
      rules: [
        {
          patterns: [
            "/new$",
            "/edit$"
          ],
          properties: {
            context: "modal"
          }
        },
        {
          patterns: [
            "/events/[a-z0-9-]+/map"
          ],
          properties: {
            view_controller: "map"
          }
        }
      ]
    }
  end

  def android_v1
    render json: {
      settings: {},
      rules: [
        {
          patterns: [
            ".*"
          ],
          properties: {
            uri: "hotwire://fragment/web",
            pull_to_refresh_enabled: true
          }
        },
        {
          patterns: [
            "/new$",
            "/edit$"
          ],
          properties: {
            context: "modal",
            pull_to_refresh_enabled: false
          }
        },
        {
          patterns: [
            "/events/[a-z0-9-]+/map"
          ],
          properties: {
            uri: "hotwire://fragment/map",
            title: "Map"
          }
        }
      ]
    }
  end
end
