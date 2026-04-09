-- Comic Parking Management System Database Schema

-- Vehicle
vehicle_categories [icon: truck, color: blue] {
  id string pk
  name string
  description string
}

vehicles [icon: car, color: blue] {
  id string pk
  license_plate string
  category_id string fk
  owner_name string
  contact_number string
}

-- Parking infrastructure
parking_zones [icon: map-pin, color: purple] {
  id string pk
  name string
  level int
  total_spots int
}

spot_categories [icon: tag, color: orange] {
  id string pk
  name string
  is_reserved boolean
  description string
}

parking_spots [icon: square, color: purple] {
  id string pk
  zone_id string fk
  category_id string fk
  spot_number string
  is_available boolean
  vehicle_size_supported string
}

-- Session and ticketing
parking_sessions [icon: clock, color: green] {
  id string pk
  vehicle_id string fk
  spot_id string fk
  entry_time timestamp
  exit_time timestamp
  is_active boolean
}

parking_tickets [icon: file-text, color: yellow] {
  id string pk
  session_id string fk
  ticket_number string
  issued_at timestamp
}

-- Payment
payments [icon: credit-card, color: green] {
  id string pk
  session_id string fk
  amount decimal
  payment_method string
  payment_status string
  paid_at timestamp
}

-- Relationships
vehicles.category_id > vehicle_categories.id
parking_spots.zone_id > parking_zones.id
parking_spots.category_id > spot_categories.id
parking_sessions.vehicle_id > vehicles.id
parking_sessions.spot_id > parking_spots.id
parking_tickets.session_id - parking_sessions.id
payments.session_id - parking_sessions.id