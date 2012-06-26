# = Class: lockss::config
#
# This class provides configuration for lockss
#
class lockss::config inherits lockss::params {
  user {
    'lockss':
      ensure => present,
      shell  => '/bin/bash',
      home   => '/home/lockss';

    'lcap':
      ensure => present,
      shell  => '/bin/bash',
      home   => '/home/lcap',
      groups => 'wheel';
  }

  file {
    $conf_dir:
      ensure => directory;

    $data_dir:
      ensure => directory,
      owner  => 'lockss',
      group  => 'lockss';

    "${data_dir}/tmp":
      ensure => directory,
      owner  => 'lockss',
      group  => 'lockss';

    $log_dir:
      ensure => directory,
      owner  => 'lockss',
      group  => 'lockss';

    "${pid_dir}/lockss.pid":
      ensure => present,
      owner  => $daemon_user,
      group  => $daemon_group;

    "${conf_dir}/.answers":
      ensure  => present,
      mode    => '0640',
      owner   => 'lockss',
      group   => 'lockss',
      content => template('lockss/answers');

    "${conf_dir}/config.dat":
      ensure  => present,
      mode    => '0640',
      owner   => 'lockss',
      group   => 'lockss',
      content => template('lockss/config.dat');

    "${conf_dir}/hostconfig":
      ensure  => present,
      mode    => '0750',
      owner   => 'lockss',
      group   => 'lockss',
      content => template('lockss/hostconfig');

    "${conf_dir}/upgrade-lockss":
      ensure => present,
      mode   => '0755';

    "${conf_dir}/lockss-config-iptables":
      ensure => present,
      mode   => '0755';

    '/home/lockss':
      ensure  => directory,
      owner   => 'lockss',
      group   => 'lockss',
      mode    => '0700',
      require => User['lockss'];

    '/home/lockss/.ssh':
      ensure => directory,
      owner  => 'lockss',
      group  => 'lockss',
      mode   => '0700';

    '/home/lockss/.ssh/authorized_keys':
      ensure => present,
      owner  => 'lockss',
      group  => 'lockss',
      mode   => '0600';

    '/home/lcap':
      ensure  => directory,
      owner   => 'lcap',
      group   => 'lcap',
      mode    => '0700',
      require => User['lcap'];

    '/home/lcap/.ssh':
      ensure => directory,
      owner  => 'lcap',
      group  => 'lcap',
      mode   => '0700';

    '/home/lcap/.ssh/authorized_keys':
      ensure => present,
      owner  => 'lcap',
      group  => 'lcap',
      mode   => '0600';

    '/etc/sudoers.d/lockss':
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0440',
      content => 'lockss ALL=(ALL) PASSWD: ALL';
  }

  ssh_authorized_key {
    'lockss tal@lox':
      ensure  => present,
      type    => 'ssh-dss',
      user    => 'lockss',
      require => File['/home/lockss/.ssh'],
      key     => 'AAAAB3NzaC1kc3MAAACBANx7cIq4vvEedmp6SeZ0aB6MKVGuhMDMfdpeab62V0VUW7ngXjMcCEBW0XazpkY/UHG1VVgoGA5otlkbu//NIsN/oDvnkIDT0vLebJfhEqxlfouBA0nBEpvE/Zks5G7TccOjKDTBz6xJ9iihVgV4WvD9nZaj926I120ycKne6ydzAAAAFQDDvJ+SQHYy4UlEPpugtH6PrCq9CQAAAIB/l6r1H6nLstjN+qWjzJVVKZ6JQ7lCeFCyu+2xZAM2KuNbrbihg4r5OLuwdn/XnEYPqJzTpD/Dt73GmCNdAcWRfE2vNZKAoaOIhqAEaecI1vfP1ldDUFmggZnfrdVzDslnnuG31HzGbNh70Sw4C9Fq1p8ff/uPnivBMmfDe3UQfAAAAIAg1aY5fDVlnmGlOeRFXlccmA4mf7505+Aj0/y9f1Fa6KYf4/CX//bnwgF1AzBUHtMWV/5Oza7+vBkuiAirFj3KZkKWLknUujE6yb495yomElXFR4mbEiEUEWubqtPn7bR9BYc348c1GyYW+3geD7ra2ViNJohgm8OuYsPCnHwpLw==';

    'lcap tal@lox':
      ensure  => present,
      type    => 'ssh-dss',
      user    => 'lcap',
      require => File['/home/lcap/.ssh'],
      key     => 'AAAAB3NzaC1kc3MAAACBANx7cIq4vvEedmp6SeZ0aB6MKVGuhMDMfdpeab62V0VUW7ngXjMcCEBW0XazpkY/UHG1VVgoGA5otlkbu//NIsN/oDvnkIDT0vLebJfhEqxlfouBA0nBEpvE/Zks5G7TccOjKDTBz6xJ9iihVgV4WvD9nZaj926I120ycKne6ydzAAAAFQDDvJ+SQHYy4UlEPpugtH6PrCq9CQAAAIB/l6r1H6nLstjN+qWjzJVVKZ6JQ7lCeFCyu+2xZAM2KuNbrbihg4r5OLuwdn/XnEYPqJzTpD/Dt73GmCNdAcWRfE2vNZKAoaOIhqAEaecI1vfP1ldDUFmggZnfrdVzDslnnuG31HzGbNh70Sw4C9Fq1p8ff/uPnivBMmfDe3UQfAAAAIAg1aY5fDVlnmGlOeRFXlccmA4mf7505+Aj0/y9f1Fa6KYf4/CX//bnwgF1AzBUHtMWV/5Oza7+vBkuiAirFj3KZkKWLknUujE6yb495yomElXFR4mbEiEUEWubqtPn7bR9BYc348c1GyYW+3geD7ra2ViNJohgm8OuYsPCnHwpLw==';

    'lockss dshr@shuttle':
      ensure  => present,
      type    => 'ssh-dss',
      user    => 'lockss',
      require => File['/home/lockss/.ssh'],
      key     => 'AAAAB3NzaC1kc3MAAACBAMVVTAVuQvKBX0EpJet1otrvPPHfihU0+eLRi5sMaxFwpd2TwoEdySIyzbUjYMeTfpSnRulXaP/ULcclpaRNk+B5je6o1STZAzcqbSmSbbIdHcLVS5goFsGDdLGW+gI9HR/TRcvrm4UIreQH1PsAqsgBEvBAZXCHhxvPFZJHilonAAAAFQChSMlu6X17xbWW5f+O9Aek1kq2SQAAAIEAwjx+YYhC/nR+WYYWqSwKKHJc5Ubr+XbDIHOaAsGj+ojfpW8o/yNaWwOXohXOy7ndgBVyZKHwJZpgI2fNS4p35ibXfGUFLJTFf5irPGAI1SHNs4vneg92SvxmM5KFNozh+rd+2EtDl71jGyumWMEzEh7ZdM351/8qJLGlC775Fy4AAACAFX/1RMA/jPN6gLidkn8GaEL7wGd332f7owmOCBTS6kehR9/r9JPXeSnNEPKznI7jJ4GeBw6M6jN06pyWXnXXua7vR8bn60DBQ1Hp9J79A/HgcrKnFNjSo8IPPX6/69n/tJV7hJRRRbUwb0T4xY0AxaYYWKKWmuhhKLNSOo1C5m0=';

    'lcap dshr@shuttle':
      ensure  => present,
      type    => 'ssh-dss',
      user    => 'lcap',
      require => File['/home/lcap/.ssh'],
      key     => 'AAAAB3NzaC1kc3MAAACBAMVVTAVuQvKBX0EpJet1otrvPPHfihU0+eLRi5sMaxFwpd2TwoEdySIyzbUjYMeTfpSnRulXaP/ULcclpaRNk+B5je6o1STZAzcqbSmSbbIdHcLVS5goFsGDdLGW+gI9HR/TRcvrm4UIreQH1PsAqsgBEvBAZXCHhxvPFZJHilonAAAAFQChSMlu6X17xbWW5f+O9Aek1kq2SQAAAIEAwjx+YYhC/nR+WYYWqSwKKHJc5Ubr+XbDIHOaAsGj+ojfpW8o/yNaWwOXohXOy7ndgBVyZKHwJZpgI2fNS4p35ibXfGUFLJTFf5irPGAI1SHNs4vneg92SvxmM5KFNozh+rd+2EtDl71jGyumWMEzEh7ZdM351/8qJLGlC775Fy4AAACAFX/1RMA/jPN6gLidkn8GaEL7wGd332f7owmOCBTS6kehR9/r9JPXeSnNEPKznI7jJ4GeBw6M6jN06pyWXnXXua7vR8bn60DBQ1Hp9J79A/HgcrKnFNjSo8IPPX6/69n/tJV7hJRRRbUwb0T4xY0AxaYYWKKWmuhhKLNSOo1C5m0=';

    'lockss thib@sul-lockss30.stanford.edu':
      ensure  => present,
      type    => 'ssh-dss',
      user    => 'lockss',
      require => File['/home/lockss/.ssh'],
      key     => 'AAAAB3NzaC1kc3MAAAEBAO6LSBgn0iczRT7IGpD2XX04++ogfjX/N5cEvoMfvjdlKBx7qQ/q3YLXvUUtUxmJHyskaJAY9BpJ07u3bUbiKZTTCE160Os+6cwmTYn8xXeITnqZXDHVt8u4Ebp9phQUcyLmEuAF6FzmTVpd8zCxwrUefo0icTcBjplNjxghJy9nTYoWl3t/EF+l5/aY1VPJ0QcsL5R80qg+31UkYaHMcf9RDM55ilPOnzqRZjE/FCcaib2i71+0nCreibyjnu7Lc+Ky3oP+teV5fko97Of1mB9xYXvxm65cX5nwpYHrepanEI+Kf4r2ictfIcdDek4HH8g2s5mmPzXOb2f3+avTnQsAAAAVAPvGe7Va5knPWI8m+8BNzNDFeR2nAAABAQCQSpK4nL8sT84pULx3g1jwjFgM3Vm84Lp7BtqFsaH9d1tJjwCnjiOaRg9andf0c9yeLzet1J+C8NcOweMRW1ZDbVjzcbhCMbm2Bc5GFbZ6XMirOsGGwyJXvWOT9U4Mg542srQ61TW0Yp0J6jtqWY8576geuIxS3qXrqcH68aLjid96OxFGyHi4iV277jJvNWoKd+0DnRmHzYlzNY7rfpGFp8lKkK7UypV6zR0y3h+ArW9I4+31JlcsPaqIFncvT/JQ+TVf2Q4fONobTyP4gVwyKIAURLRu9LAHXvn5ZUuHgukNO19u7flY+SjQCs4TNwPAQW68B9Os2ctOfvvRJ76nAAABABeMf8G5XkKFyrYYSR2E0xPQW53FR5ozz4M0C8QXzdnJiK64sBy9HQ6WAgMvi0bgZMLGWk+90iXa8ENY9IHjtSK9InwdvtkcnXPpZt9kBTKks9J63/Kt+Z3ACc0ABkOGfbezJ/pZ1Ae70EoWS8YyshIAB44Ytnse+mDd8JYilKvstTvr8H4t45VELXHLIIJchZoNImk4vhOP8QtMH9XDm69X8a/9lm7O88xE4pDiPvwi+cuKBz0XHzo+8A2nyy3+6uamZhGVTlYuQAO0M6+URqmbFGWAA7+KZcB1ej6nLeK1gIZPtXITeRL7LGgPt4SAy/NEQFfthbWH94Ighu0orMs=';

    'lcap thib@sul-lockss30.stanford.edu':
      ensure  => present,
      type    => 'ssh-dss',
      user    => 'lcap',
      require => File['/home/lcap/.ssh'],
      key     => 'AAAAB3NzaC1kc3MAAAEBAO6LSBgn0iczRT7IGpD2XX04++ogfjX/N5cEvoMfvjdlKBx7qQ/q3YLXvUUtUxmJHyskaJAY9BpJ07u3bUbiKZTTCE160Os+6cwmTYn8xXeITnqZXDHVt8u4Ebp9phQUcyLmEuAF6FzmTVpd8zCxwrUefo0icTcBjplNjxghJy9nTYoWl3t/EF+l5/aY1VPJ0QcsL5R80qg+31UkYaHMcf9RDM55ilPOnzqRZjE/FCcaib2i71+0nCreibyjnu7Lc+Ky3oP+teV5fko97Of1mB9xYXvxm65cX5nwpYHrepanEI+Kf4r2ictfIcdDek4HH8g2s5mmPzXOb2f3+avTnQsAAAAVAPvGe7Va5knPWI8m+8BNzNDFeR2nAAABAQCQSpK4nL8sT84pULx3g1jwjFgM3Vm84Lp7BtqFsaH9d1tJjwCnjiOaRg9andf0c9yeLzet1J+C8NcOweMRW1ZDbVjzcbhCMbm2Bc5GFbZ6XMirOsGGwyJXvWOT9U4Mg542srQ61TW0Yp0J6jtqWY8576geuIxS3qXrqcH68aLjid96OxFGyHi4iV277jJvNWoKd+0DnRmHzYlzNY7rfpGFp8lKkK7UypV6zR0y3h+ArW9I4+31JlcsPaqIFncvT/JQ+TVf2Q4fONobTyP4gVwyKIAURLRu9LAHXvn5ZUuHgukNO19u7flY+SjQCs4TNwPAQW68B9Os2ctOfvvRJ76nAAABABeMf8G5XkKFyrYYSR2E0xPQW53FR5ozz4M0C8QXzdnJiK64sBy9HQ6WAgMvi0bgZMLGWk+90iXa8ENY9IHjtSK9InwdvtkcnXPpZt9kBTKks9J63/Kt+Z3ACc0ABkOGfbezJ/pZ1Ae70EoWS8YyshIAB44Ytnse+mDd8JYilKvstTvr8H4t45VELXHLIIJchZoNImk4vhOP8QtMH9XDm69X8a/9lm7O88xE4pDiPvwi+cuKBz0XHzo+8A2nyy3+6uamZhGVTlYuQAO0M6+URqmbFGWAA7+KZcB1ej6nLeK1gIZPtXITeRL7LGgPt4SAy/NEQFfthbWH94Ighu0orMs=';

    'lockss daniel@lockss.org':
      ensure  => present,
      type    => 'ssh-dss',
      user    => 'lockss',
      require => File['/home/lockss/.ssh'],
      key     => 'AAAAB3NzaC1kc3MAAACBANVUrj2/TTL4qOeA5LacnoHXtz+hRI/xO4A5zzUyDFndAUNx3QNCalhufaf1LKdU3T2FeGDmRg8LpkYZ0u7Sb3LVy6kJHk2nV6WrAo4n9sjXlSoEW/eCf9XEU/VuxLRTjTznZ5wOmGMwqiS8EqLxMaPnczDNq4+5Ia1othXUNalVAAAAFQCu5wcTnFzm5hLOHwSeiniYNGidewAAAIEAiUWbfSMC7Bfdd1x6egY56VFS34mhmVYGRjMuPUnoxyNAnczQ7h4nY7WCDRHoQLZrzBebcYy19o5/xV/Zt6iE83OfuKLvAyoIic8a0q7ySdD/7XyJe7xMiNUJszvohk7rkhDftQMQZW2G0MaHf4t8vVZ72WXx/wVW7gktVm+K/XMAAACAE2NbBjjKEyRbZif6+rxapBHNW9eqoigMkdjglEP137Lrb3erYVycXOOpw9jID9KGtcqvRtnPXPZeNOlG+jt70WNxv6Ip+6aDkp1QW9LDTLsvM6uugVPklTV0bQnEHvlEISJM+esXQhhRvBTy2oct+qt017W31fcAppmQbWcH32w=';

    'lcap daniel@lockss.org':
      ensure  => present,
      type    => 'ssh-dss',
      user    => 'lcap',
      require => File['/home/lcap/.ssh'],
      key     => 'AAAAB3NzaC1kc3MAAACBANVUrj2/TTL4qOeA5LacnoHXtz+hRI/xO4A5zzUyDFndAUNx3QNCalhufaf1LKdU3T2FeGDmRg8LpkYZ0u7Sb3LVy6kJHk2nV6WrAo4n9sjXlSoEW/eCf9XEU/VuxLRTjTznZ5wOmGMwqiS8EqLxMaPnczDNq4+5Ia1othXUNalVAAAAFQCu5wcTnFzm5hLOHwSeiniYNGidewAAAIEAiUWbfSMC7Bfdd1x6egY56VFS34mhmVYGRjMuPUnoxyNAnczQ7h4nY7WCDRHoQLZrzBebcYy19o5/xV/Zt6iE83OfuKLvAyoIic8a0q7ySdD/7XyJe7xMiNUJszvohk7rkhDftQMQZW2G0MaHf4t8vVZ72WXx/wVW7gktVm+K/XMAAACAE2NbBjjKEyRbZif6+rxapBHNW9eqoigMkdjglEP137Lrb3erYVycXOOpw9jID9KGtcqvRtnPXPZeNOlG+jt70WNxv6Ip+6aDkp1QW9LDTLsvM6uugVPklTV0bQnEHvlEISJM+esXQhhRvBTy2oct+qt017W31fcAppmQbWcH32w=';

    'lockss adamr@content1':
      ensure  => present,
      type    => 'ssh-dss',
      user    => 'lockss',
      require => File['/home/lockss/.ssh'],
      key     => 'AAAAB3NzaC1kc3MAAACBAKeEpvxeTU+gEWFm1ONiU4YBHhwr0ykegaoZ3g9Nv3LlBEFxgaY729Fnbb8dRa2BWzUKkphex+RIsSCtjSCQ/+XsEXza+D6UDrpZesWgKWOJOYEbc7T26eVOuInmDNSrE+QM+RI4g6g3qvHqrJjS5rGfGFHEGx54x9hBxFdQpeYrAAAAFQCsw4/Y/XtrfqKtVdAJh5cCd9pNdQAAAIAIckt2VSQqMrKH6IoR7yVH8eBIwRDxmE/sswoB2pj4+muPp6jZq/4OQ+oPorOdRLfBydZ2k8S2EOCUP0cH22uvYFgGpbPDWTQVi69kYk+dOVKZDr5/JCtMbg/szkTaJWOkdCyxK1R0bgU+GA4V0MuynCDbdIgVFZbejem6UzSwfgAAAIACcHiibtziXJfQC/GYZkg35CarNTg0ZjyO0Ikig8UL960buOSqpywVG3fkb34h4dmr0jRrdql56EqZEGetElp0K88uEZF2/2qfhLgvG2lM7AiJ91fVOSSxp8PkC/ApuXR32a+mKrSVUwQpMoMtzzkwzvSmjGaXA2c5k8fua9IM9w==';

    'lcap adamr@content1':
      ensure  => present,
      type    => 'ssh-dss',
      user    => 'lcap',
      require => File['/home/lcap/.ssh'],
      key     => 'AAAAB3NzaC1kc3MAAACBAKeEpvxeTU+gEWFm1ONiU4YBHhwr0ykegaoZ3g9Nv3LlBEFxgaY729Fnbb8dRa2BWzUKkphex+RIsSCtjSCQ/+XsEXza+D6UDrpZesWgKWOJOYEbc7T26eVOuInmDNSrE+QM+RI4g6g3qvHqrJjS5rGfGFHEGx54x9hBxFdQpeYrAAAAFQCsw4/Y/XtrfqKtVdAJh5cCd9pNdQAAAIAIckt2VSQqMrKH6IoR7yVH8eBIwRDxmE/sswoB2pj4+muPp6jZq/4OQ+oPorOdRLfBydZ2k8S2EOCUP0cH22uvYFgGpbPDWTQVi69kYk+dOVKZDr5/JCtMbg/szkTaJWOkdCyxK1R0bgU+GA4V0MuynCDbdIgVFZbejem6UzSwfgAAAIACcHiibtziXJfQC/GYZkg35CarNTg0ZjyO0Ikig8UL960buOSqpywVG3fkb34h4dmr0jRrdql56EqZEGetElp0K88uEZF2/2qfhLgvG2lM7AiJ91fVOSSxp8PkC/ApuXR32a+mKrSVUwQpMoMtzzkwzvSmjGaXA2c5k8fua9IM9w==';
  }
}

