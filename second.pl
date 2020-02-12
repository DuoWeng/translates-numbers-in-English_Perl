#!/usr/bin/perl -w
@digit = ("","one","two","three","four","five","six","seven","eight","nine");
@teen = ("ten","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen");
@tens = ("","","twenty","thirty","fourty","fifty","sixty","seventy","eighty","ninety");
while(1){
	print "\nEnter number or quit(halt): ";
	$input = <STDIN>;
	chomp($input);
	$input =~ tr/A-Z/a-z/;
	if($input eq 'halt'){last}
	print "The number is : $input\n";
	if($input == 0) {print "zero\n";next;}
	if($input < 100)  {digit2($input);print"\n";}
	elsif($input < 1000){digit3($input);print"\n";}
	elsif($input < 1000000){digit6($input);print"\n";}
	elsif($input < 1000000000){digit9($input);print"\n";}
	elsif($input >= 10000000000){print "You input invalid number\n";}
	else{print "$digit[$input/1000000000] billion ";digit9($input%1000000000);}
}
sub digit2{
my ($num) = @_;
if($num < 10)  {print $digit[$num];}
elsif($num < 20){print $teen[$num%10];}
elsif($num < 100){if($num%10 == 0 ) {print  $tens[$num/10];}
		  else{ print"$tens[$num/10] $digit[$num%10]";}
		 }
}

sub digit3{
my ($num) = @_;
if($num < 100){digit2($num);}
else{print "$digit[$num/100] hundred "; digit2($num%100);}
}
sub digit6{
my ($num) = @_;
if($num < 1000){digit3($num);}
else{digit3($num/1000) ;print " thousand "; digit3($num%1000);}
}
sub digit9{
my ($num) = @_;
if($num < 1000000){digit6($num);}
else{digit3($num/1000000);print" million ";digit6($num%1000000);}
}




