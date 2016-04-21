#!/usr/bin/perl
use XML::XPath; 
use XML::XPath::XMLParser; 
$inputfile = $ARGV[0];
`touch tmp.xml`;
$outputfile = "tmp.xml";

=cut
my $xp = XML::XPath->new($inputfile); 
my($root) = $xp->findnodes('/'); 

my $nodeset = $root->find('/list/jbr'); 

foreach my $node ($nodeset->get_nodelist) { 
      if($node->toString =~ /main_/i) { 
        my $parent = $node->getParentNode; 
        $parent = $node->getParentNode; 
        $parent->removeChild($node); 
      } 
  } 

`echo "$root->toString" > $outfile`; 
=cut
open ( NEWXML,'>',$outputfile );
open ( XML, $inputfile);
while(<XML>)
{
	my $result;
	if(/<time>/)
	{
		@return = split ( /<|>/, $_ );
		$humantime = $return[2]/1000;
 		chomp ($humantime = `gawk 'BEGIN{print strftime("%Y-%m-%d",'$humantime')}'`);
		#print "<time> $humantime</time>\n";
		$result = "<time> $humantime</time>\n";
	}
	elsif (/<d>/|/<\/d>/)
	{;}
	elsif (/<timezone>/)
	{;}
	else
	{
		#print "$_ \n";
		$result =  $_ ;
	}
$result =~ s/<r>/<result>/g;
$result =~ s/<n>/<job_name>/g;
$result =~ s/<\/r>/<\/result>/g;
$result =~ s/<\/n>/<\/job_name>/g;
$result =~ s/nn/node_name/g ;
$result =~ s/du/build_duration/g ;
$result =~ s/un/user/g ;

print NEWXML "$result"; 
}
close XML;
close NEWXML;

my $xp = XML::XPath->new($outputfile);
my($root) = $xp->findnodes('/');

my $nodeset = $root->find('/list/jbr');

foreach my $node ($nodeset->get_nodelist) {
      unless($node->toString =~ /master_/i) {
        my $parent = $node->getParentNode;
        $parent = $node->getParentNode;
        $parent->removeChild($node);
      }
  }

print $root->toString;

