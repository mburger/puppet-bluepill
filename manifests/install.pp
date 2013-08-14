# Class: bluepill::install
#
# This class installs bluepill
#
# == Variables
#
# Refer to bluepill class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by bluepill
#
class bluepill::install inherits bluepill {

  package { $bluepill::package:
    ensure    => $bluepill::manage_package,
    provider  => $bluepill::package_provider,
    noop      => $bluepill::bool_noops,
  }
}
