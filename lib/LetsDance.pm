package LetsDance;
use Mojo::Base 'Mojolicious';
use autouse 'Data::Dump' => qw(dd pp);


# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  # add node_modules to static routes so we can serve these files
  # painlessly
  push @{ $self->static->paths }, $self->home . '/node_modules';

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('main#welcome');
}

1;
