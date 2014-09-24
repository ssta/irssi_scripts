use strict;
use warnings;

sub cmd_rot13 {
  # data - contains the parameters for /REV
  # server - the active server in window
  # witem - the active window item (eg. channel, query)
  #         or undef if the window is empty
  my ($data, $server, $witem) = @_;

  if (!$server || !$server->{connected}) {
    Irssi::print("Not connected to server");
    return;
  }

  if ($data && $witem &&($witem->{type} eq "CHANNEL" ||
                      $witem->{type} eq "QUERY")) {
    $data =~ tr/abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/nopqrstuvwxyzabcdefghijklmNOPQRSTUVWXYZABCDEFGHIJKLM/;
    $server->command("MSG ".$witem->{name}." $data");
  } else {
    Irssi::print("No active channel/query in window");
  }
}

Irssi::command_bind('rot13', 'cmd_rot13');
