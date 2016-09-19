use Mojo::Base -strict;

use Test::More;
use Test::Mojo;
use Mojo::DOM;
use Mojo::JSON qw(decode_json);

my $t = Test::Mojo->new('LetsDance');

my $ua       = $t->ua;
my $api_data = decode_json(
    $ua->get('http://api.tv4play.se/site/programs/lets-dance')->res->body );
my $person_tag =
  $api_data->{participant_groups}[0]{participants}[0]{person_tag};
$t->get_ok("/videolist/$person_tag")->status_is(200);
my $dom = Mojo::DOM->new( $t->tx->res->body );
for my $e ( $dom->find('a.videopage:not([aria-label])')->each ) {
    $t->get_ok("/videolist/$person_tag?page=$e->{'data-page'}")->status_is(200)->content_like(qr/active/);
}

done_testing();
