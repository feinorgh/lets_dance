package LetsDance::Controller::Main;
use Mojo::Base 'Mojolicious::Controller';
use Mojo::JSON qw(decode_json encode_json);

sub program_info {
    my $self = shift;
    my $ua   = $self->app->useragent;
    my $data = decode_json(
        $ua->get('http://api.tv4play.se/site/programs/lets-dance')->res->body );
    $self->render( info => $data );
    return 1;
}

sub participants {
    my $self = shift;
    my $ua   = $self->app->useragent;
    my $data = decode_json(
        $ua->get('http://api.tv4play.se/site/programs/lets-dance')->res->body );
    $self->render( info => $data );
    return 1;
}

sub get_videolist {
    my $self       = shift;
    my $person_tag = $self->param('person_tag');
    my $page       = $self->param('page') // 1;
    my $ua         = $self->app->useragent;
    my $videoinfo  = decode_json(
        $ua->get(
            'http://api.tv4play.se/play/video_assets.json?tags='
              . $person_tag => form => { page => $page }
        )->res->body
    );
    my @results = @{ $videoinfo->{results} };
    my $max_results = $self->cookie('max_results') || 1;

    if ( @results > $max_results ) {
        $max_results = scalar @results;
        $self->cookie( max_results => $max_results );
    }
    my $total_hits = $videoinfo->{total_hits};
    $self->render(
        template   => 'parts/videolist',
        videolist  => [@results],
        page       => $page,
        pages      => 1 + int $total_hits / $max_results,
        total_hits => $total_hits,
    );
    return 1;
}

1;
