#Class: bluepill::config
#
# This class manages bluepill configuration
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
class bluepill::config ( ) {

  # The whole bluepill configuration directory can be recursively overriden
  if $bluepill::source_dir {
    file { 'bluepill.dir':
      ensure  => directory,
      path    => $bluepill::config_dir,
      notify  => $bluepill::manage_service_autorestart,
      source  => $bluepill::source_dir,
      recurse => true,
      purge   => $bluepill::bool_source_dir_purge,
      force   => $bluepill::bool_source_dir_purge,
      replace => $bluepill::manage_file_replace,
      audit   => $bluepill::manage_audit,
      noop    => $bluepill::bool_noops,
    }
  }
  else {
    file { 'bluepill.dir':
      ensure  => $bluepill::data_dir_ensure,
      path    => $bluepill::config_dir,
      replace => $bluepill::manage_file_replace,
      audit   => $bluepill::manage_audit,
      noop    => $bluepill::bool_noops,
    }
  }

  include concat::setup

  concat { $bluepill::config_file:
    mode    => $bluepill::config_file_mode,
    owner   => $bluepill::config_file_owner,
    group   => $bluepill::config_file_group,
  }

  concat::fragment { 'bluepill_head':
    ensure  => present,
    order   => '01',
    target  => $bluepill::config_file,
    content => template('bluepill/bluepill_head.rb.erb'),
    require => File['bluepill.dir'],
  }

  concat::fragment { 'bluepill_footer':
    ensure  => present,
    order   => '03',
    target  => $bluepill::config_file,
    content => template('bluepill/bluepill_footer.rb.erb'),
    require => File['bluepill.dir'],
  }
}
