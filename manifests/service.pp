# Class: bluepill::service
#
# This class manages bluepill services
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
class bluepill::service inherits bluepill {

  service { 'bluepill':
    ensure     => $bluepill::manage_service_ensure,
    name       => $bluepill::service,
    enable     => $bluepill::manage_service_enable,
    hasstatus  => $bluepill::service_status,
    pattern    => $bluepill::process,
    noop       => $bluepill::bool_noops,
  }

  case $bluepill::package_provider {
    gem: {
      file { 'bluepill.initd':
        ensure  => $bluepill::manage_file,
        path    => $bluepill::initd_path,
        mode    => '0755',
        owner   => $bluepill::config_file_owner,
        group   => $bluepill::config_file_group,
        before  => Service['bluepill'],
        content => template($bluepill::initd_template),
        audit   => $bluepill::manage_audit,
      }
    }
    default: {}
  }
}
