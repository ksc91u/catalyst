package MyApp::Controller::Root;
#use strict;
use warnings;
#use Catalyst::Plugin::Session;
#use Catalyst::Plugin::Session::State::Cookie;
#use Catalyst::Plugin::Session::Store::FastMmap;
#use Catalyst qw/Session Session::State::Cookie Session::Store::FastMmap/;
use parent 'Catalyst::Controller';

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config->{namespace} = '';

=head1 NAME

MyApp::Controller::Root - Root Controller for MyApp

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=cut

=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    # Hello World
    #$c->response->body( $c->welcome_message );
}

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

sub translate :Local{
	my($self, $c) = @_;
	my $lol = $c->req->body_params->{lol};
	my $tr=$c->model('Translate')->translate($lol);
	my $result= $tr."<br>Previouse Queries<br>".join "<br>\n",@{ $c->session->{items} };
	unshift @{ $c->session->{items} }, $tr;
	$c->stash(
		lol => $lol,
		result => $result,
		template => 'index.tt',
	);
}

sub add : Local{}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

root

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
