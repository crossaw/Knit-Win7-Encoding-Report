#!perl
#inspectHTML.pl

$i  = $rtext = 0; # r is for Russian
@tt = ("PASTED TEXT:", "KNITTED TEXT:"); # type of text

while (<>) {
   if ($rtext & /^<p/) {
      $fb = unpack 'H*', $_;
      $fb =~ s/../$& /g;
      print "\n$tt[$i++]\n$fb\n";
      $rtext = 0;
   }
   $rtext = 1 if /The text is pasted|cat\(russianText\)/;
}