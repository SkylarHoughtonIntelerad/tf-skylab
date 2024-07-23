locals {
  use2 = {
    # "cw_logs_to_s3" = {
    #   architectures         = ["arm64"]
    #   archive_file          = "src/cw_logs_to_s3.zip"
    #   common_function       = true
    #   handler               = "cw_logs_to_s3.cw_logs_to_s3"
    #   function_code         = "python/cw_logs_to_s3.py"
    #   log_retention_in_days = 7
    #   role                  = "arn:aws:iam::959946720450:role/cw_logs_to_s3"
    #   runtime               = "python3.12"
    #   timeout               = 60
    #   environment_variables = {
    #     BUCKET_NAME = "plt-test-cw-log-export"
    #   }
    # }
    "plt-test-mw-error-slackbot" = {
      architectures         = ["arm64"]
      archive_file          = "src/slackbot.zip"
      handler               = "slackbot.slackbot"
      function_code         = "python/slackbot.py"
      log_retention_in_days = 7
      role                  = "arn:aws:iam::959946720450:role/slackbot"
      runtime               = "python3.9"
      timeout               = 10
      environment_variables = {
        LOG_LEVEL         = "INFO"
        SLACK_CHANNEL     = "platform-test-error-alerts"
        SLACK_WEBHOOK_URL = "https://hooks.slack.com/services/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"
      }
    }
    "plt-test-mw-info-slackbot" = {
      architectures         = ["arm64"]
      archive_file          = "src/slackbot.zip"
      handler               = "slackbot.slackbot"
      function_code         = "python/slackbot.py"
      log_retention_in_days = 7
      role                  = "arn:aws:iam::959946720450:role/slackbot"
      runtime               = "python3.9"
      timeout               = 10
      environment_variables = {
        LOG_LEVEL         = "INFO"
        SLACK_CHANNEL     = "platform-test-info-alerts"
        SLACK_WEBHOOK_URL = "https://hooks.slack.com/services/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"
      }
    }
    "plt-test-mw-notify-teamsbot" = {
      architectures         = ["arm64"]
      archive_file          = "src/teamsbot.zip"
      handler               = "teamsbot.teamsbot"
      function_code         = "python/teamsbot.py"
      layer_name            = "pymsteams"
      layer_runtime         = "python"
      log_retention_in_days = 7
      role                  = "arn:aws:iam::959946720450:role/slackbot"
      runtime               = "python3.9"
      timeout               = 10
      environment_variables = {
        BOT_NAME    = "plt-test-mw-notify-teamsbot"
        LOG_LEVEL   = "INFO"
        WEBHOOK_URL = "https://inteleradmedicalsystem412.webhook.office.com/webhookb2/74d4ca47-7c51-49c6-9b6a-95cd22f8d166@919e55e0-dee3-4dd5-88b3-56f99d78012b/IncomingWebhook/236c1b5095a54900b3806d7370193424/9fb9825c-0dcf-452f-84d7-52844dc60e6b"
      }
    }
    "plt-test-mw-alert-teamsbot" = {
      architectures         = ["arm64"]
      archive_file          = "src/teamsbot.zip"
      handler               = "teamsbot.teamsbot"
      function_code         = "python/teamsbot.py"
      layer_name            = "pymsteams"
      layer_runtime         = "python"
      log_retention_in_days = 7
      role                  = "arn:aws:iam::959946720450:role/slackbot"
      runtime               = "python3.9"
      timeout               = 10
      environment_variables = {
        BOT_NAME    = "plt-test-mw-alert-teamsbot"
        LOG_LEVEL   = "INFO"
        WEBHOOK_URL = "https://inteleradmedicalsystem412.webhook.office.com/webhookb2/74d4ca47-7c51-49c6-9b6a-95cd22f8d166@919e55e0-dee3-4dd5-88b3-56f99d78012b/IncomingWebhook/323af0beea9441a59c5917a4effd17e9/9fb9825c-0dcf-452f-84d7-52844dc60e6b"
      }
    }
  }
}
