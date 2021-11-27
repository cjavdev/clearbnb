me = User.find_or_create_by!(
  email: 'wave@cjav.dev',
) do |u|
  u.password = 'password'
end

10.times do
  listing = Listing.create(
    host: me,
    title: Faker::Lorem.words.join(" "),
    about: Faker::Lorem.paragraphs.join("\n"),
    max_guests: (1...15).to_a.sample,
    address_line1: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: 'US',
    status: [:draft, :published].sample,
  )
end


10.times do
  host = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )

  10.times do
    listing = Listing.create(
      host: host,
      title: Faker::Lorem.words.join(" "),
      about: Faker::Lorem.paragraphs.join("\n"),
      max_guests: (1...15).to_a.sample,
      address_line1: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      country: 'US',
      status: [:draft, :published].sample,
    )
  end
end


