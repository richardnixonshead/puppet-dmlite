class dmlite::plugins::domeadapter::config::head (
  $davix_ca_path      = $dmlite::plugins::domeadapter::params::davix_ca_path,
  $davix_cert_path    = $dmlite::plugins::domeadapter::params::davix_cert_path,
  $davix_private_key_path = $dmlite::plugins::domeadapter::params::davix_private_key_path,
  $dome_head_url      = $dmlite::plugins::domeadapter::params::dome_head_url,
  $dome_disk_url      = $dmlite::plugins::domeadapter::params::dome_disk_url,
  $token_password,
  $token_id           = $dmlite::plugins::domeadapter::params::token_id,
  $token_life         = $dmlite::plugins::domeadapter::params::token_life,
  $adminuser          = undef,
  $disknode 	      = $dmlite::plugins::domeadapter::params::disknode,
  $empty_conf         = false,
) inherits dmlite::plugins::domeadapter::params {

  Class[dmlite::plugins::domeadapter::install] -> Class[dmlite::plugins::domeadapter::config::head]


  dmlite::plugins::domeadapter::create_config{'head_config':
    config_dir_name    => 'dmlite',   # put file in /etc/dmlite.conf.d/domeadapter.conf
    dome_head_url      => $dome_head_url,
    dome_disk_url      => $dome_disk_url,
    davix_ca_path      => $davix_ca_path,
    davix_cert_path    => $davix_cert_path,
    davix_private_key_path => $davix_private_key_path,
    enable_io          => true,
    enable_ns          => false,
    enable_pooldriver  => true,
    enable_catalog     => true,
    token_password     => $token_password,
    token_id           => $token_id,
    token_life         => $token_life,
    adminuser          => $adminuser,
    disknode           => $disknode,
    empty_conf         => $empty_conf,
  }

  dmlite::plugins::domeadapter::create_config{'disk_config_http':
    config_dir_name    => 'dmlite-disk',   # put file in /etc/dmlite-disk.conf.d/domedaapter.conf
    dome_head_url      => $dome_head_url,
    dome_disk_url      => $dome_disk_url,
    davix_ca_path      => $davix_ca_path,
    davix_cert_path    => $davix_cert_path,
    davix_private_key_path => $davix_private_key_path,
    enable_io          => true,
    enable_ns          => true,
    enable_pooldriver  => true,
    token_password     => $token_password,
    token_id           => $token_id,
    token_life         => $token_life,
    adminuser          => $adminuser,
    disknode           => $disknode,
    empty_conf         => $empty_conf,
  }
}

