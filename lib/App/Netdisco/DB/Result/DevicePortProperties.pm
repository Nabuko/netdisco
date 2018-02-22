use utf8;
package App::Netdisco::DB::Result::DevicePortProperties;

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->table("device_port_properties");
__PACKAGE__->add_columns(
  "ip",
  { data_type => "inet", is_nullable => 0 },
  "port",
  { data_type => "text", is_nullable => 0 },
  "error_disable_cause",
  { data_type => "text", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("port", "ip");


=head1 RELATIONSHIPS

=head2 port

Returns the entry from the C<port> table for which this Power entry applies.

=cut

__PACKAGE__->belongs_to( port => 'App::Netdisco::DB::Result::DevicePort', {
  'foreign.ip' => 'self.ip', 'foreign.port' => 'self.port',
});

1;