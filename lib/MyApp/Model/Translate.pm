package MyApp::Model::Translate;

use strict;
use warnings;
use parent 'Catalyst::Model';
use Acme::LOLCAT ();

sub translate{
	my($self,$text) = @_;
	return Acme::LOLCAT::translate($text);
}

=head1 NAME

MyApp::Model::Translate - Catalyst Model

=head1 DESCRIPTION

Catalyst Model.

=head1 AUTHOR

root

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
