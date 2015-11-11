  def user_attributes(overrides = {})
    {
      id: 1,
      username: "William Wallace",
      email: "william.wallace@scotland.com",
      password: "Testing1",
      confirmation_token: "SnyTkyRFgXTiu2yv3zPR",
      confirmed_at: "2015-11-06 01:52:06.581611",
      confirmation_sent_at: "2015-11-06 01:51:04.418457"
    }.merge(overrides)
  end
