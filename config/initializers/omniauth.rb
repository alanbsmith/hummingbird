Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, Figaro.env.github_consumer_id, Figaro.env.github_consumer_secret
end
