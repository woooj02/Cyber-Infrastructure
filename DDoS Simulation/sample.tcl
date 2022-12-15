# Creating New Simulator
set ns [new Simulator]

# Setting up the traces
set f [open out.tr w]
set nf [open out.nam w]
$ns namtrace-all $nf
$ns trace-all $f
proc finish {} { 
	global ns nf f
	$ns flush-trace
	puts "Simulation completed."
	close $nf
	close $f
	exit 0
}



#Create Nodes
#Bots:
set bot01 [$ns node]
      puts "bot01: [$bot01 id]"
set bot02 [$ns node]
      puts "bot02: [$bot02 id]"
set bot03 [$ns node]
      puts "bot03: [$bot03 id]"
set bot04 [$ns node]
      puts "bot04: [$bot04 id]"
set bot05 [$ns node]
      puts "bot05: [$bot05 id]"
set bot06 [$ns node]
      puts "bot06: [$bot06 id]"
set bot07 [$ns node]
      puts "bot07: [$bot07 id]"
set bot08 [$ns node]
      puts "bot08: [$bot08 id]"
set bot09 [$ns node]
      puts "bot09: [$bot09 id]"

#Routers:	  
set router01 [$ns node]
      puts "router01: [$router01 id]"
set router02 [$ns node]
      puts "router02: [$router02 id]"
set router03 [$ns node]
      puts "router03: [$router03 id]"
set router04 [$ns node]
      puts "router04: [$router04 id]"
set router05 [$ns node]
      puts "router05: [$router05 id]"
set router06 [$ns node]
      puts "router06: [$router06 id]"
set router07 [$ns node]
      puts "router07: [$router07 id]"
set router08 [$ns node]
      puts "router08: [$router08 id]"
set router09 [$ns node]
      puts "router09: [$router09 id]"
set router10 [$ns node]
      puts "router10: [$router10 id]"
set router11 [$ns node]
      puts "router11: [$router11 id]"                  
set router12 [$ns node]
      puts "router12: [$router12 id]"
set router13 [$ns node]
      puts "router13: [$router13 id]"
set router14 [$ns node]
      puts "router14: [$router14 id]"
set router15 [$ns node]
      puts "router15: [$router15 id]"   
set router16 [$ns node]
      puts "router16: [$router16 id]"                  


#Users:  
set user01 [$ns node]
      puts "user01: [$user01 id]"
set user02 [$ns node]
      puts "user02: [$user02 id]"
set user03 [$ns node]
      puts "user03: [$user03 id]"
set user04 [$ns node]
      puts "user04: [$user04 id]"
	  
#Webserver:
set WebServer [$ns node]
      puts "WebServer: [$WebServer id]"

#Decoys:
set decoy01 [$ns node]
      puts "decoy01: [$decoy01 id]"
set decoy02 [$ns node]
      puts "decoy02: [$decoy02 id]"
set decoy03 [$ns node]
      puts "decoy03: [$decoy03 id]"

#Shapes and Colors:
$router01 shape hexagon
$router01 label "R1"
$router02 shape hexagon
$router02 label "R2"
$router03 shape hexagon
$router03 label "R3"
$router04 shape hexagon
$router04 label "R4"
$router05 shape hexagon
$router05 label "R5"
$router06 shape hexagon
$router06 label "R6"
$router07 shape hexagon
$router07 label "R7"
$router08 shape hexagon
$router08 label "R8"
$router09 shape hexagon
$router09 label "R9"
$router10 shape hexagon
$router10 label "R10"
$router11 shape hexagon
$router11 label "R11"
$router12 shape hexagon
$router12 label "R12"
$router13 shape hexagon
$router13 label "R13"
$router14 shape hexagon
$router14 label "R14"
$router15 shape hexagon
$router15 label "R15"
$router16 shape hexagon
$router16 label "R16"

$bot01 color red
$bot01 label "Bot1"
$bot02 color red
$bot02 label "Bot2"
$bot03 color red
$bot03 label "Bot3"
$bot04 color red
$bot04 label "Bot4"
$bot05 color red
$bot05 label "Bot5"
$bot06 color red
$bot06 label "Bot6"
$bot07 color red
$bot07 label "Bot7"
$bot08 color red
$bot08 label "Bot8"
$bot09 color red
$bot09 label "Bot9"

$user01 color green
$user01 label "User1"
$user02 color green
$user02 label "User2"
$user03 color green
$user03 label "User3"
$user04 color green
$user04 label "User4"

$WebServer color blue
$WebServer label "Web Server"

$decoy01 color orange
$decoy01 label "Decoy1"
$decoy02 color orange
$decoy02 label "Decoy2"
$decoy03 color orange
$decoy03 label "Decoy3"

#Setup Connections
#This is a little messy, but it works:
$ns duplex-link $bot01 $router01 950kb 5ms RED
$ns duplex-link $user01 $router01 950kb 5ms RED
$ns duplex-link $router01 $router09 950kb 5ms RED
$ns duplex-link $bot02 $router02 950kb 5ms RED
$ns duplex-link $router02 $router09 950kb 5ms RED
$ns duplex-link $bot09 $router16 950kb 5ms RED
$ns duplex-link $router16 $router09 950kb 5ms RED
$ns duplex-link $decoy01 $router13 950kb 5ms RED
$ns duplex-link $router13 $router15 950kb 5ms RED
$ns duplex-link $router09 $router13 950kb 5ms RED
$ns duplex-link $router09 $router15 950kb 5ms RED
$ns duplex-link-op $router09 $router15 color purple
$ns duplex-link-op $router09 $router15 label "Target Link 2"
$ns duplex-link $router13 $router15 950kb 5ms RED
$ns duplex-link $router14 $router13 950kb 5ms RED
$ns duplex-link-op $router14 $router13 color purple
$ns duplex-link-op $router14 $router13 label "Target Link 1"
$ns duplex-link $router11 $router15 950kb 5ms RED
$ns duplex-link-op $router11 $router15 color purple
$ns duplex-link-op $router11 $router15 label "Target Link 3"
$ns duplex-link $router15 $decoy02 950kb 5ms RED
$ns duplex-link $router15 $decoy03 950kb 5ms RED
$ns duplex-link $user03 $router05 950kb 5ms RED
$ns duplex-link $bot03 $router03 950kb 5ms RED
$ns duplex-link $router03 $router04 950kb 5ms RED
$ns duplex-link $bot04 $router04 950kb 5ms RED
$ns duplex-link $user02 $router04 950kb 5ms RED
$ns duplex-link $router10 $router14 950kb 5ms RED
$ns duplex-link $router04 $router10 950kb 5ms RED
$ns duplex-link $bot05 $router05 950kb 5ms RED
$ns duplex-link $router05 $router14 950kb 5ms RED
$ns duplex-link $bot07 $user04 950kb 5ms RED
$ns duplex-link $bot07 $router07 950kb 5ms RED
$ns duplex-link $user04 $router07 950kb 5ms RED
$ns duplex-link $bot06 $router06 950kb 5ms RED
$ns duplex-link $router06 $router11 950kb 5ms RED
$ns duplex-link $router12 $router11 950kb 5ms RED
$ns duplex-link $bot08 $router08 950kb 5ms RED
$ns duplex-link $router08 $router12 950kb 5ms RED
$ns duplex-link $router12 $router11 950kb 5ms RED
$ns duplex-link $router07 $router11 950kb 5ms RED
$ns duplex-link $router15 $WebServer 950kb 5ms RED
$ns duplex-link-op $router15 $WebServer color green


#Set up Transportation Level Connections
#Webserver with NULL:
set null_WebServer [new Agent/Null]
$ns attach-agent $WebServer $null_WebServer

set null_decoy01 [new Agent/Null]
$ns attach-agent $decoy01 $null_decoy01

set null_decoy02 [new Agent/Null]
$ns attach-agent $decoy02 $null_decoy02

set null_decoy03 [new Agent/Null]
$ns attach-agent $decoy03 $null_decoy03

#Bot UDP traffic:
set udp_bot01 [new Agent/UDP]
$ns attach-agent $bot01 $udp_bot01
set udp_bot02 [new Agent/UDP]
$ns attach-agent $bot02 $udp_bot02
set udp_bot03 [new Agent/UDP]
$ns attach-agent $bot03 $udp_bot03
set udp_bot04 [new Agent/UDP]
$ns attach-agent $bot04 $udp_bot04
set udp_bot05 [new Agent/UDP]
$ns attach-agent $bot05 $udp_bot05
set udp_bot06 [new Agent/UDP]
$ns attach-agent $bot06 $udp_bot06
set udp_bot07 [new Agent/UDP]
$ns attach-agent $bot07 $udp_bot07
set udp_bot08 [new Agent/UDP]
$ns attach-agent $bot08 $udp_bot08
set udp_bot09 [new Agent/UDP]
$ns attach-agent $bot09 $udp_bot09

#User UDP Traffic:
set udp_user01 [new Agent/UDP]
$ns attach-agent $user01 $udp_user01
set udp_user02 [new Agent/UDP]
$ns attach-agent $user02 $udp_user02
set udp_user03 [new Agent/UDP]
$ns attach-agent $user03 $udp_user03
set udp_user04 [new Agent/UDP]
$ns attach-agent $user04 $udp_user04



#Setup traffic sources
#Bot Sources:
set cbr_bot01 [new Application/Traffic/CBR]
$cbr_bot01 set rate_ 800kb
$cbr_bot01 attach-agent $udp_bot01

set cbr_bot02 [new Application/Traffic/CBR]
$cbr_bot02 set rate_ 800kb
$cbr_bot02 attach-agent $udp_bot02

set cbr_bot03 [new Application/Traffic/CBR]
$cbr_bot03 set rate_ 800kb
$cbr_bot03 attach-agent $udp_bot03

set cbr_bot04 [new Application/Traffic/CBR]
$cbr_bot04 set rate_ 800kb
$cbr_bot04 attach-agent $udp_bot04

set cbr_bot05 [new Application/Traffic/CBR]
$cbr_bot05 set rate_ 800kb
$cbr_bot05 attach-agent $udp_bot05

set cbr_bot06 [new Application/Traffic/CBR]
$cbr_bot06 set rate_ 800kb
$cbr_bot06 attach-agent $udp_bot06

set cbr_bot07 [new Application/Traffic/CBR]
$cbr_bot07 set rate_ 800kb
$cbr_bot07 attach-agent $udp_bot07

set cbr_bot08 [new Application/Traffic/CBR]
$cbr_bot08 set rate_ 800kb
$cbr_bot08 attach-agent $udp_bot08

set cbr_bot09 [new Application/Traffic/CBR]
$cbr_bot09 set rate_ 800kb
$cbr_bot09 attach-agent $udp_bot09

#User Sources:
set cbr_user01 [new Application/Traffic/CBR]
$cbr_user01 set rate_ 100Kb
$cbr_user01 attach-agent $udp_user01

set cbr_user02 [new Application/Traffic/CBR]
$cbr_user02 set rate_ 100Kb
$cbr_user02 attach-agent $udp_user02

set cbr_user03 [new Application/Traffic/CBR]
$cbr_user03 set rate_ 100Kb
$cbr_user03 attach-agent $udp_user03

set cbr_user04 [new Application/Traffic/CBR]
$cbr_user04 set rate_ 100Kb
$cbr_user04 attach-agent $udp_user04


#connect traffic sources to traffic destination (for CBR components, the destination is defined as a NULL component)
$ns connect $udp_bot01 $null_decoy02
$ns connect $udp_bot02 $null_decoy02
$ns connect $udp_bot09 $null_decoy02
$ns connect $udp_bot05 $null_decoy01
$ns connect $udp_bot03 $null_decoy01
$ns connect $udp_bot04 $null_decoy01
$ns connect $udp_bot08 $null_decoy03
$ns connect $udp_bot06 $null_decoy03
$ns connect $udp_bot07 $null_decoy03
$ns connect $udp_user01 $null_WebServer
$ns connect $udp_user02 $null_WebServer
$ns connect $udp_user03 $null_WebServer
$ns connect $udp_user04 $null_WebServer

#define colors for traffic types (bot vs. user)
$ns color 1 green
$ns color 2 red

#sets udp_bot01 and udp_bot02 traffic color to red
$udp_bot01 set fid_ 2
$udp_bot02 set fid_ 2
$udp_bot03 set fid_ 2
$udp_bot04 set fid_ 2
$udp_bot05 set fid_ 2
$udp_bot06 set fid_ 2
$udp_bot07 set fid_ 2
$udp_bot08 set fid_ 2
$udp_bot09 set fid_ 2

# set udp_user01 (user) traffic color to green
$udp_user01 set fid_ 1 
$udp_user02 set fid_ 1 
$udp_user03 set fid_ 1 
$udp_user04 set fid_ 1 


#Start up the sources
$ns set-animation-rate 3ms

#Start Bots:
$ns at 0 "$cbr_bot01 start" 
$ns at 0 "$cbr_bot02 start"
$ns at 0 "$cbr_bot03 start"
$ns at 0 "$cbr_bot04 start"
$ns at 0 "$cbr_bot05 start"
$ns at 0 "$cbr_bot06 start"
$ns at 0 "$cbr_bot07 start"
$ns at 0 "$cbr_bot08 start"
$ns at 0 "$cbr_bot09 start"

#Start Users:
$ns at 0 "$cbr_user01 start"
$ns at 0 "$cbr_user02 start"
$ns at 0 "$cbr_user03 start"
$ns at 0 "$cbr_user04 start"

#End Simulation after 10 Seconds:
$ns at 10.0 "finish"

#Run Simulation:
$ns run