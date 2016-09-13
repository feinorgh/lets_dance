package LetsDance;
use Mojo::Base 'Mojolicious';
use Mojo::UserAgent;
use autouse 'Data::Dump' => qw(dd pp);

my $_useragent;
has 'useragent' => sub {
    if ( !defined $_useragent ) {
        $_useragent = Mojo::UserAgent->new;
    }
    return $_useragent;
};

# This method will run once at server start
sub startup {
    my $self = shift;

    # Documentation browser under "/perldoc"
    $self->plugin('PODRenderer');

    $self->plugin('Config');

    # add node_modules to static routes so we can serve these files
    # painlessly
    push @{ $self->static->paths }, $self->home . '/node_modules';

    # Router
    my $r = $self->routes;

    # Normal route to controller
    $r->get('/')->to('main#program_info');
    $r->get('/participants')->to('main#participants');
    $r->get('/videolist/:person_tag')->to('main#get_videolist');
    return 1;
}

1;
