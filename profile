bind -a $home/bin/rc /bin
bind -a $home/bin/$cputype /bin
if(! syscall create /tmp/xxx 1 0666 >[2]/dev/null)
	ramfs	# in case we're running off a cd
font=/lib/font/bit/dejavusans/dajavusans.12.font
switch($service){
case terminal
	if(! webcookies >[2]/dev/null)
		webcookies -f /tmp/webcookies
	webfs
	plumber
	echo -n accelerated > '#m/mousectl'
	echo -n 'res 3' > '#m/mousectl'
	prompt=('term% ' '	')
	fn term%{ $* }
	rio -i riostart
case cpu
	webfs
	upas/fs -f /imaps/imap.gmail.com/michaelczigler@mcpcpc.com
	plumber
	bind /mnt/term/dev/cons /dev/cons
	bind -q /mnt/term/dev/consctl /dev/consctl
	>[2] /dev/null {
		cp /dev/sysname /mnt/term/dev/label
		if(wsys=`{cat /mnt/term/env/wsys})
			wsys=/mnt/term^$wsys
	} 
	bind -a /mnt/term/dev /dev
	prompt=('cpu% ' '	')
	fn cpu%{ $* }
	cat $home/lib/wall | rio -s -i riostart
case con
	prompt=('cpu% ' '	')
}
