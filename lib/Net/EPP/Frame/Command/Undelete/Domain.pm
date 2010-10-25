# Copyright (c) 2010 CentralNic Ltd. All rights reserved. This program is
# free software; you can redistribute it and/or modify it under the same
# terms as Perl itself.
# 
# $Id$
package Net::EPP::Frame::Command::Undelete::Domain;
use base qw(Net::EPP::Frame::Command::Undelete);
use Net::EPP::Frame::ObjectSpec;
use strict;

=pod

=head1 NAME

Net::EPP::Frame::Command::Undelete::Domain - an instance of L<Net::EPP::Frame::Command::Undelete>
for domain names.

=head1 SYNOPSIS

	use Net::EPP::Frame::Command::Undelete::Domain;
	use strict;

	my $undelete = Net::EPP::Frame::Command::Undelete::Domain->new;
	$undelete->setDomain('example.tld');

	print $undelete->toString(1);

This results in an XML document like this:

	<?xml version="1.0" encoding="UTF-8"?>
	<epp xmlns="urn:ietf:params:xml:ns:epp-1.0"
	  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	  xsi:schemaLocation="urn:ietf:params:xml:ns:epp-1.0
	  epp-1.0.xsd">
	    <command>
	      <undelete>
	        <domain:undelete
	          xmlns:domain="urn:ietf:params:xml:ns:domain-1.0"
	          xsi:schemaLocation="urn:ietf:params:xml:ns:domain-1.0
	          domain-1.0.xsd">
	            <domain:name>example.tldE<lt>/domain:name>
	        </domain:undelete>
	      </undelete>
	      <clTRID>0cf1b8f7e14547d26f03b7641660c641d9e79f45</clTRIDE<gt>
	    </command>
	</epp>

=head1 OBJECT HIERARCHY

    L<XML::LibXML::Node>
    +----L<XML::LibXML::Document>
        +----L<Net::EPP::Frame>
            +----L<Net::EPP::Frame::Command>
                +----L<Net::EPP::Frame::Command::Undelete>
                    +----L<Net::EPP::Frame::Command::Undelete::Domain>

=cut

sub new {
	my $package = shift;
	my $self = bless($package->SUPER::new('undelete'), $package);

	my $domain = $self->addObject(Net::EPP::Frame::ObjectSpec->spec('domain'));

	return $self;
}

=pod

=head1 METHODS

	$frame->setDomain($domain_name);

This specifies the domain name to be undeleted.

=cut

sub setDomain {
	my ($self, $domain) = @_;

	my $name = $self->createElement('domain:name');
	$name->appendText($domain);

	$self->getNode('undelete')->getChildNodes->shift->appendChild($name);

	return 1;
}

=pod

=head1 AUTHOR

CentralNic Ltd (http://www.centralnic.com/).

=head1 COPYRIGHT

This module is (c) 2007 CentralNic Ltd. This module is free software; you can
redistribute it and/or modify it under the same terms as Perl itself.

=head1 SEE ALSO

=over

=item * L<Net::EPP::Frame>

=back

=cut

1;
