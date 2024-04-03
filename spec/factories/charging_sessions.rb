FactoryBot.define do
  factory :charging_session do
    association :user
    status { "active" }
    start_time { Time.current }
    end_time { nil }
  end
end
