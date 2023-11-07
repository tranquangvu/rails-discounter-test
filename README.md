# Discounter

## Getting Started

1. Installation:

- Use ruby `3.2.2`
- Install bundler: `gem install bundler`
- Install packages: `bundle install`
- Generate new rails master key `rm -f config/credentials.yml.enc && rm -rf config/master.key && EDITOR=vim rails credentials:edit`
- Database setup: `bin/rails db:setup`
- Start rails server: `bin/rails s`

2. Testing:

- Run `rspec` | `bin/bundle exec rspec`
