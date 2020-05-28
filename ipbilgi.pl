use Socket;
use Term::ANSIColor;
use WWW::Mechanize;
use JSON;

print color 'bold bright_blue';
 
print q{
	 	a88888b.                   d888888P           888888ba  
		d8'   `88                      88              88    `8b 
		88        dP    dP 88d888b.    88    .d8888b. a88aaaa8P' 
		88        88    88 88'  `88    88    88ooood8  88   `8b. 
		Y8.   .88 88.  .88 88.  .88    88    88.  ...  88     88 
		 Y88888P' `8888P88 88Y888P'    dP    `88888P'  dP     dP 
		               .88 88                                    
		           d8888P  dP                                    


Ip Konum ve Bilgi Araci 
CODER: CypTeR-Mikail

------------------------------------
};
 
print color 'reset';
@iphost=$ARGV[0] || die "Kullanimi : ./ipbilgi.pl [host] [ip] [domain] \n\nEx:  ./ipbilgi.pl  www.google.com \n     ./Iplocation.pl  216.58.210.206\n \n";
my @ip = inet_ntoa(scalar gethostbyname("@iphost")or die "IP ADRESi VEYA HOST YOK!\n");
my @hn = scalar gethostbyaddr(inet_aton(@ip),AF_INET);
 
my $GET=WWW::Mechanize->new();
    $GET->get("http://ip-api.com/json/@ip"); 
    my $json = $GET->content();
 
 
my $info = decode_json($json);

 
print "  [!] IP: ", $info->{'query'}, "\n";
print "------------------------------------\n"; 
print "  [+] ORG: ", $info->{'as'}, "\n";
print "  [+] ISP: ", $info->{'isp'}, "\n";
print "  [+] Ulke: ", $info->{'country'}," - ", $info->{'countryCode'}, "\n";
print "  [+] Sehir: ", $info->{'city'}, "\n";
print "  [+] Bolge: ", $info->{'regionName'}, " - " , $info->{'region'}, "\n";
print "  [+] Geo: ", "Lat: " , $info->{'lat'}, " - Long: ", $info->{'lon'}, "\n";
print "  [+] Geo: ", "Latitude: " , $info->{'lat'}, " - Long: ", $info->{'lat'}, "\n";
print "  [+] Zaman: ", "timezone: " , $info->{'timezone'}, " - Long: ", $info->{'timezone'}, "\n";
print "  [+] Internet Saglayicisi: ", "as: " , $info->{'as'}, " - Long: ", $info->{'as'}, "\n";
print "  [+] ORG: ", $info->{'as'}, "\n";
print "  [+] Ulke Kodu: ", $info->{'countryCode'}, "\n"; 
print "  [+] Durum: ", $info->{'status'}, "\n"; 
print "\n";

