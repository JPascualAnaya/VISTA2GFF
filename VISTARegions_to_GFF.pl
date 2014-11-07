#! /usr/bin/perl -w

use strict;
use warnings;

my $usage="USAGE: perl VISTARegions_to_GFF.pl VISTA_regions.txt ";
my $root;

my $regions_filename=$ARGV[0];
chomp $regions_filename;


# Do the files exist?
unless ( -e $regions_filename) {
    print "File \"$regions_filename\" doesn\'t seem to exist!!\n$usage\n\n";
    exit;
}


# Open regions file 1
unless (open (REGIONS, $regions_filename)) {
    print "Cannot open file \"$regions_filename\"\n\n";
    exit;
}

# Create the output file, using the same name as the one of the input file
($root)=$ARGV[0]=~/(.+)\./;

unless (open (OUTPUT, ">$root.gff") ){
    print "Cannot create an output file\n\n";
    exit;
}

# Define variables
my @Psinensis_regions;

while (<REGIONS>){
    @Psinensis_regions=split(/\t/);
    
    print OUTPUT "PsinERC2-WNT5A-CACNA\tVISTA\tSO:0000334\t$Psinensis_regions[0]\t$Psinensis_regions[3]\t.\t+\t.\n";
    #SOFA accession number for non-coding element: SO:0000334
    
}

close REGIONS;
close OUTPUT;

exit;
