#
# AUTHOR:   Daniel Baeurer <daniel.baeurer@gmail.com>
# REQUIRES: Rex::Framework::Cloudera::PkgRepository
# LICENSE:  GPLv3
# DESC:     Installs Mahout.
#

package Rex::Framework::Cloudera::Mahout;

use strict;
use warnings;

use Rex -base;

# define os-distribution specific package names
our %package_name = (
   Debian => "mahout",
   Ubuntu => "mahout",
); 

# determine os-distribution
my $os_distro = get_operating_system();

task "setup", sub {

   # defining package based on os-distribution
   my $package = $package_name{$os_distro};

   # install package
   update_package_db;
   install package => $package;

};

1;

=pod

=head1 NAME

Rex::Framework::Cloudera::Mahout - Installs Mahout

=head1 DESCRIPTION

Apache Mahout is a machine-learning tool. By enabling you to build
machine-learning libraries that are scalable to "reasonably large"
datasets, it aims to make building intelligent applications easier
and faster.

This Rex-Module will install Mahout.

=head1 USAGE

Put it in your I<Rexfile>

 require Rex::Framework::Cloudera::Mahout;
  
 task yourtask => sub {
    Rex::Framework::Cloudera::Mahout::setup();
 };

And call it directly:

 rex -H $host yourtask

Or directly
 rex -H $host Rex::Framework::Cloudera::Mahout::setup()

=head1 TASKS

=over 4

=item setup

This task will install mahout server.

=back

=cut
