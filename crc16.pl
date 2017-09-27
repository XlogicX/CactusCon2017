use Digest::CRC qw(crc16); 
$/ = undef; 
open IN, 'SLIDE_Us.bin'; 
my $program = <IN>; 
my $crc = crc16($program); 
print "$crc\n"; 
close IN;