VISTA2GFF
=========

Perl script that formats the coordinates of a VISTA analysis result into GFF format.

VISTA returns a file, called filename.regions, with the coordinates of the conserved elements found (as defined by the user in a plot file). You can discard the elements found within the gene locus by doing 

<code>for f in *.regions; do  cat $f | egrep noncoding > $f.noncoding; done<code/>

Then, you can format them into GFF by

<code>perl VISTARegions_to_GFF.pl filename.noncoding<code/>

Which will generate a file called filename.gff

This file can be managed for instance by bedtools.
