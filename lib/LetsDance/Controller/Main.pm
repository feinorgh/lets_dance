package LetsDance::Controller::Main;
use Mojo::Base 'Mojolicious::Controller';
use Mojo::JSON qw(decode_json);

sub program_info {
    my $self = shift;
    my $ua   = $self->app->useragent;
    my $data = decode_json($ua->get('http://api.tv4play.se/site/programs/lets-dance')->res->body);
    $self->render( info => $data );
    return 1;
}

sub participants {
    my $self = shift;
    my $ua   = $self->app->useragent;
    my $data = decode_json($ua->get('http://api.tv4play.se/site/programs/lets-dance')->res->body);
    $self->render( info => $data );
    return 1;
}

1;
