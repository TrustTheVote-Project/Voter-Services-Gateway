class CreateVoters < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.string :elector_id
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :gender
      t.integer :dob_year
      t.integer :dob_month
      t.integer :dob_day
      t.integer :address_number
      t.string :address_number_suffix
      t.string :unit_number
      t.string :street_name
      t.string :street_type
      t.string :street_direction
      t.string :place
      t.string :province
      t.string :postal_code
      t.string :rural_address_line
      t.string :mailing_address_line_1
      t.string :mailing_address_line_2
      t.string :mailing_place
      t.string :mailing_province
      t.string :mailing_postal_code
      t.string :mailing_country_code
      t.string :request_status
      t.datetime :request_date
      t.integer :request_uid
      t.datetime :modify_date

      t.timestamps
    end
  end
end
