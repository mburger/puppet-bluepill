define bluepill::process (
  $template       = 'bluepill/process.rb.erb',
  $process        = '',
  $pidfile        = '',
  $startprogram   = '',
  $stopprogram    = '',
  $cycles         = '5',
  $enable         = 'true') {

  $ensure = bool2ensure($enable)

  require bluepill

  $real_process = $process ? {
    ''      => $process,
    default => $name,
  }

  $real_pidfile = $pidfile ? {
    ''      => "/var/run/${process}.pid",
    default => $pidfile,
  }

  $real_startprogram = $startprogram ? {
    ''      => "/etc/init.d/${process} start",
    default => $startprogram,
  }

  $real_stopprogram = $stopprogram ? {
    ''      => "/etc/init.d/${process} stop",
    default => $stopprogram,
  }

  concat::fragment { "bluepill_process_${name}":
    ensure  => $ensure,
    order   => '02',
    target  => $bluepill::config_file,
    content => template($template),
  }
}
