FactoryBot.define do
    factory :user do
        email { 'testing@testing.com' }
        password { 'testing' }
        password_confirmation { 'testing' }
    end
end