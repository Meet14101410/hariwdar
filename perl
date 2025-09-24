#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

my $data_file = 'haridwar_data.txt';
open my $fh, '<', $data_file or die "Cannot open '$data_file': $!";

my %haridwar_data;

# Read and parse the data file
while (my $line = <$fh>) {
    chomp $line;
    next if $line =~ /^#/;
    my ($type, $name, $description) = split /\|/, $line;
    push @{$haridwar_data{$type}}, {
        name => $name,
        description => $description
    };
}
close $fh;

# Generate a report for a specific category
sub generate_report_by_type {
    my $type = shift;
    print "--- Report on $type in Haridwar ---\n";
    if (exists $haridwar_data{$type}) {
        foreach my $item (@{$haridwar_data{$type}}) {
            print "  - Name: $item->{name}\n";
            print "    Description: $item->{description}\n";
        }
    } else {
        print "No data found for type '$type'.\n";
    }
    print "\n";
}

# Main script logic
generate_report_by_type("Religious Site");
generate_report_by_type("Ghat");

__END__
# Data for haridwar_data.txt
# Type|Name|Description
Ghat|Har Ki Pauri|The most sacred ghat in Haridwar, known for the evening Ganga Aarti.
Religious Site|Mansa Devi Temple|A popular temple on a hilltop, accessible by ropeway.
Religious Site|Chandi Devi Temple|Another hilltop temple dedicated to Goddess Chandi.
