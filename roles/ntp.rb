name "ntp"
description "Role applied to the system that should be an NTP client."
default_attributes(
)
override_attributes(
 "ntp" => {
    "servers" => ["0.pool.ntp.org", "1.pool.ntp.org"],
#    "is_server" => "true",
#    "peers" => ["time0.int.example.org", "time1.int.example.org"],
#    "restrictions" => ["10.0.0.0 mask 255.0.0.0 nomodify notrap"]
  }
)
run_list "recipe[ntp]"
