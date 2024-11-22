apt update && apt upgrade -y
echo 'dev.tty.ldisc_autoload = 0'>>/etc/sysctl.d/99-sysctl.conf
echo 'fs.protected_fifos = 2'>>/etc/sysctl.d/99-sysctl.conf
echo 'kernel.core_uses_pid = 1'>>/etc/sysctl.d/99-sysctl.conf
echo 'kernel.kptr_restrict = 2'>>/etc/sysctl.d/99-sysctl.conf
echo 'kernel.modules_disabled = 1'>>/etc/sysctl.d/99-sysctl.conf
echo 'kernel.sysrq = 0'>>/etc/sysctl.d/99-sysctl.conf
echo 'kernel.unprivileged_bpf_disabled = 1'>>/etc/sysctl.d/99-sysctl.conf
echo 'net.ipv4.conf.all.accept_redirects = 0'>>/etc/sysctl.d/99-sysctl.conf
echo 'net.ipv4.conf.all.log_martians = 1'>>/etc/sysctl.d/99-sysctl.conf
echo 'net.ipv4.conf.all.rp_filter = 1'>>/etc/sysctl.d/99-sysctl.conf
echo 'net.ipv4.conf.all.send_redirects = 0'>>/etc/sysctl.d/99-sysctl.conf
echo 'net.ipv4.conf.default.accept_redirects = 0'>>/etc/sysctl.d/99-sysctl.conf
echo 'net.ipv4.conf.default.accept_source_route = 0'>>/etc/sysctl.d/99-sysctl.conf
echo 'net.ipv4.conf.default.log_martians = 1'>>/etc/sysctl.d/99-sysctl.conf
echo 'net.ipv6.conf.all.accept_redirects = 0'>>/etc/sysctl.d/99-sysctl.conf
echo 'net.ipv6.conf.default.accept_redirects = 0'>>/etc/sysctl.d/99-sysctl.conf
grep -v "X11Forwarding" /etc/ssh/sshd_config  > /tmp/test.conf && mv /tmp/test.conf /etc/ssh/sshd_config
echo 'AllowTcpForwarding no'>> /etc/ssh/sshd_config
echo 'LogLevel verbose'>> /etc/ssh/sshd_config
echo 'MaxAuthTries 3'>> /etc/ssh/sshd_config
echo 'ClientAliveCountMax 2'>> /etc/ssh/sshd_config
echo 'MaxSessions 2'>> /etc/ssh/sshd_config
echo 'TCPKeepAlive no'>> /etc/ssh/sshd_config
echo 'AllowAgentForwarding no'>> /etc/ssh/sshd_config
echo 'Port 1984'>> /etc/ssh/sshd_config


echo 'install dccp /bin/true' >/etc/modprobe.d/dccp.conf
echo 'install sctp /bin/true' >/etc/modprobe.d/sctp.conf
echo 'install rds /bin/true' >/etc/modprobe.d/rds.conf
echo 'install tipc /bin/true' >/etc/modprobe.d/tipc.conf
echo 'blacklist usb_storage'>/etc/modprobe.d/blacklist-usb-storage.conf
echo 'blacklist firewire-core'>/etc/modprobe.d/blacklist-firewire-core.conf
apt install debsums -y
apt install apt-show-versions -y
apt install fail2ban -y
apt install clamav -y
echo  '* hard core 0' >> /etc/security/limits.conf
echo  '* soft core 0' >> /etc/security/limits.conf
grep -v "UMASK" /etc/login.defs  > /tmp/test.conf && mv /tmp/test.conf /etc/login.defs
echo 'UMASK           027' >> /etc/login.defs
echo 'PASS_MAX_DAYS 90' >> /etc/login.defs
echo 'PASS_MIN_DAYS 30'>> /etc/login.defs

chmod 600 /etc/ssh/sshd_config
chmod 700 /etc/cron.d
chmod 600 /etc/crontab
chmod 700  /etc/cron.daily
chmod 700 /etc/cron.hourly
chmod 700 /etc/cron.weekly
chmod 700 /etc/cron.monthly
echo 1 > /sys/bus/usb/devices/usb1/authorized_default
echo 1 > /sys/bus/usb/devices/usb1/authorized
echo 'proc    /proc        proc        defaults,hidepid=2    0 0' >> /etc/fstab
chage -M 90 root
chage -M 90 weeki
echo 'weeki server 
------------------------------------------------------------
------------------------------------------------------------

Authorized access only!

If you are not authorized (prohibited) to access or connect or use this system, disconnect now!

------------------------------------------------------------
------------------------------------------------------------'>/etc/issue
cp /etc/issue /etc/issue.net

apt install usbguard -y
apt autoremove -y
apt-get purge $(dpkg -l | grep '^rc' | awk '{print $2}') -y
echo 'CRON_CHECK=weekly' >/etc/default/debsums
#echo 'cat << EOF'>>/etc/grub.d/00_header
#echo 'set superusers="root"'>>/etc/grub.d/40_custom
#echo 'password_pbkdf2 root grub.pbkdf2.sha512.10000.85BE51ADC3EF48D61AF1A543BAC8B0BEA6E4582D3F621063C4C959920E3F0BE2DD495176100C22D8CCC6D528FFE87CC565640583DA343E190D6A35B32A5262A3.EAFA7E855438B3AA0DFAE94425CFC8106E1BA2C001A42C1AFE8ED4155BD8663FB0973A0FADEB307611724BB5081AFA2796050F7DEAFF546AA9E0346553CF9179'>>/etc/grub.d/40_custom
#echo 'EOF'>>/etc/grub.d/40_custom
#/usr/sbin/grub-mkconfig -o /boot/grub/grub.cfg
wget https://downloads.cisofy.com/lynis/lynis-3.1.2.tar.gz
tar xvzf lynis-3.1.2.tar.gz
cd lynis
chmod 700 lynis
./lynis audit system
