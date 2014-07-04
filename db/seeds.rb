# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Rails.env.development?
  User.destroy_all
  @user = User.create(
      username: 'user',
      email: 'user@test.com',
      password: '12345678',
      password_confirmation: '12345678',
      power: 0
    )
  @editor = User.create(
      username: 'editor',
      email: 'editor@test.com',
      password: '12345678',
      password_confirmation: '12345678',
      power: 1
    )
  @user = User.create(
      username: 'leader',
      email: 'leader@test.com',
      password: '12345678',
      password_confirmation: '12345678',
      power: 2
    )
  @admin = User.create(
      username: 'test_admin',
      email: 'admin@test.com',
      password: '12345678',
      password_confirmation: '12345678',
      power: 3
    )
end