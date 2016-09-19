use Mojo::Base -strict;

use Test::More;
use Test::Mojo;
use Mojo::JSON qw(decode_json);

my $t = Test::Mojo->new('LetsDance');

# see if the JSON API entry point is available
$t->get_ok('http://api.tv4play.se/site/programs/lets-dance')->status_is(200)
  ->json_has('participants');

$t->get_ok('/')->status_is(200)->content_like(qr/Dance/i);
$t->get_ok('/participants')->status_is(200)->content_like(qr/Participants/);
$t->get_ok('/videolist')->status_is(404);
$t->get_ok('/videolist/foo')->status_is(200);

done_testing();
