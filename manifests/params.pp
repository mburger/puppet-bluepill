# Class: bluepill::params
#
# This class defines default parameters used by the main module class bluepill
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to bluepill class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class bluepill::params {

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'bluepill',
  }

  $package_provider = $::operatingsystem ? {
    default => 'gem',
  }

  $service = $::operatingsystem ? {
    default => 'bluepill',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'bluepill',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'root',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/bluepill',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/bluepill/bluepill.rb',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/bluepill',
    default                   => '/etc/sysconfig/bluepill',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/bluepill.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/etc/bluepill/conf.d',
  }

  $initd_path = $::operatingsystem ? {
    default => '/etc/init.d/bluepill',
  }

  $initd_template = $::operatingsystem ? {
    default => 'bluepill/bluepill.initd.erb',
  }

  # General Settings
  $my_class = ''
  $source_dir = ''
  $source_dir_purge = false
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = undef

}
