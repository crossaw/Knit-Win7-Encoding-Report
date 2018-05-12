#!perl

while (<>) {
   $fb = unpack 'H*', $_;
   $fb =~ s/../$& /g;
   print "\n$fb\n";
}